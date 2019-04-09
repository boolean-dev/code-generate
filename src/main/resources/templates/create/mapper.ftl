<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}Mapper">

	<resultMap id="BaseResultMap" type="${BASE_PACKAGE}.entity.${objectName}">
		<id column="id" property="id" jdbcType="VARCHAR" />
		<#list params as param>
		<result column="${param.columnName}" property="${param.name}" jdbcType="${param.mybatisJdbcType}" />
		</#list>
		<result column="delete" property="delete" typeHandler="org.apache.ibatis.type.EnumOrdinalTypeHandler" />
		<result column="create_date" property="createDate" jdbcType="TIMESTAMP" />
		<result column="modify_date" property="modifyDate" jdbcType="TIMESTAMP" />
		<result column="sort" property="sort" jdbcType="BIGINT" />
	</resultMap>

	<sql id="columns">
		`id`,
		<#list params as param>
		`${param.columnName}`,
		</#list>
		`delete`,
		`create_date`,
		`modify_date`,
		`sort`
	</sql>
	
	<!-- 查找分页 -->
	<select id="findPage" parameterType="map" resultMap="BaseResultMap">
		SELECT
		<include refid="columns"/>
		FROM ${tableName} t
        WHERE `delete` = 0
		ORDER BY id DESC
		LIMIT ${'#'}{startIndex},${'#'}{pageSize}
	</select>
	
	<!-- 查找列表 -->
	<select id="findList" parameterType="map" resultMap="BaseResultMap">
		SELECT
		<include refid="columns"/>
		FROM ${tableName} t
        WHERE `delete` = 0
	</select>
	
	<!-- 保存 -->
	<insert id="save" useGeneratedKeys="true" keyProperty="id" parameterType="${objectName}">
	  INSERT INTO ${tableName}
	  (<include refid="columns"/>)
	  VALUES 
	  (
		${'#'}{id},
		<#list params as param>
		${'#'}{${param.name}},
		</#list>
		${'#'}{delete,typeHandler=org.apache.ibatis.type.EnumOrdinalTypeHandler},
		now(),
		now(),
		${'#'}{sort}
	  )
	</insert>
 
	<!-- 根据id查找 -->
	<select id="findById" parameterType="String" resultMap="BaseResultMap">
		SELECT	
		<include refid="columns"/>
		FROM ${tableName} t
		WHERE `delete` = 0 AND t.id = ${'#'}{id}
	</select>
	
	<!-- 修改 -->
	<update id="update" parameterType="${objectName}">
		UPDATE ${tableName}
		<trim prefix="set" suffixOverrides=","> 
			<#list params as param>
			<if test="${param.name} != null">${param.columnName} = ${'#'}{${param.name}},</if>
			</#list>
			<if test="delete != null">`delete` = ${'#'}{delete, typeHandler=org.apache.ibatis.type.EnumOrdinalTypeHandler},</if>
			modify_date = now(),
			<if test="sort != null">`sort` = ${'#'}{sort}</if>
		</trim>
		WHERE 
			id = ${'#'}{id}
	</update>
	
	<!-- 批量删除 -->
	<update id="deleteAll">
        UPDATE banner
        SET `delete` = 1
        WHERE
        id IN
		<foreach item="item" index="index" collection="array" open="(" separator="," close=")">
        	${'#'}{item}
		</foreach>
	</update>
	
	<!-- 统计 -->
	<select id="count" parameterType="map" resultType="java.lang.Long">
		SELECT
		COUNT(*)
		FROM ${tableName} t
        WHERE `delete` = 0
	</select>
	
</mapper>