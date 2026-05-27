Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6E3BE632
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901458; cv=none; b=OncBIkwh1JxU3RoYj/m0Qkm704BSqOtmVe4282+gXQYIA3mTMYl9XvRTiJMOQlc3TEaFjrYLlkw3fhMcuw0q7oneoDBXRSvTl/+ZM07eDZhUmlOSXV0WWDw4HDv/PZrjwfddp/L7dLDKrvpZ7NMQ2TLc69bS1mk0GsYPSmqZdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901458; c=relaxed/simple;
	bh=HsASMyINEQfHno0rsw+42YhTlmX4Nb5LD4aBfiSfkGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqhbwgyAw2Nj9wzIqgZ/9Pt+PeL5nFiKClE87zunV90Z2bjL390vtMYXFvrbbWZFXenVTRixQFc6ToWBnTC/W5iDFy93o9VwgIKlDKJGmtiRbyOBA0PHxi3m4rskbvmHm/wr2iu+D9k4RG8RwXph9h/udbCqggUcggVMLRlmXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEhQsBXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvMZssfb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEhQsBXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvMZssfb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFCr4J2152271
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 17:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6nha1feETo1rSKy37ATFEomW
	axLqzR6X6eFWdjB9xhc=; b=BEhQsBXLxYXh8B8T4cuZBzpDXJy3V8d+KSBqaJlf
	8sMlakShjajq9oljZ3x6QQUTUWxdjaS1K8zrY51pShQoNAtfCHbkF/qRVQ4806fX
	8Awxj+JRtqVusORT3KT+sztSa4ZJ2PoSXh92SrF6LKQlyhDhkCf9XIwov8+bcOb3
	t+lN4BDuP+oC99RaAC3XHQa7hX0pVxJtgMyxkU79vGGYD0FjiVv3YkvMIA+p62je
	1UPexMftSDe7A3quTUDCsQxZwKkysqk+ZtNzIxnIF0Xp4NA03HH7XflYoCUfNSgx
	ddqPAfK7LBeaGvoEanBhjSxltpWq0ekeP06TbBLuE6Gqog==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rjffu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 17:04:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13509e2e47bso14495831c88.1
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779901456; x=1780506256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=CvMZssfbVL2T9P7QWlFa7kLGFpWlAX9tPvtt1fwcIV+VZP5mgTcmbrIJ9ZM0/lvy+R
         huzjf0ZeNrhplV41tVhJidZhzNV1JaaLTqhhV4Yaz5ArUIQF/8zvCbkEVKoP3b9dxzvu
         PDvQstcqSSWpD+MiSOlzbF8LuBSv9sJQ/apkFA6N7HK2+Rbp6pfwxEyCjPFBJu0ul+5T
         ZGylOJGuJ1mxR2NPqlPWVcFrtF6TqsYsT29vKZnymdCwlmWPLh1Gw3Jg1DzHisfe2oIL
         jXuAJnoHxnDaQG3SmryrGjIL7cC8Yp4ciDZjeMQ7MVRhXLhv4iJKR4UcFYg4wMrQrXVd
         KQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901456; x=1780506256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=ZJmlvl6DL5UpkntYWHDBR5RQ+3D0+G9Gk79EUubGwC1ISNxLIo5KNvrcT5ggxC7Hfz
         vJqUbPjyYFaO9JTYlbDFqlRGDNq0vjjom30eNoKmedsxALleh4pxmgqYwo+74mIAcqit
         mKvRc6fqs/wAmYunyQEC6T8lKRQcrkUT+jG7aM89TpnzYSqvTnBh64JiOVOCh7LUMlAK
         aCBy0bKypUlrWb/Exyd3VBO/+sN5tb30MadwnGY3lpiKFP9V8KYZLnGSmqWoJ0RsZ/UK
         7y9DMrJue3Dm+g/eapzysDcaVnHbIU+LFEcUaGSDFE1AGBeutuXnkm0wz5nVXF8vmxW8
         bsew==
X-Forwarded-Encrypted: i=1; AFNElJ/yNvnHrKZn10+S68zjyLXObtdkAjWO52HftI2OBS3ooQl9KlbJLp6/3/QJ1vDHTCrpk3yP1JjwoyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nNHfXdxdcDSsNpgpjR+P0QxPvZjlAY8avph+ika42uOIsAPJ
	ANtW1+YzuOlSErGB10BCr3ogpuLk29QiOpXmaHNUPGrx4vhWjS8euv92w7mu0bkokGbOhGfP53O
	sGkWjn7WFdZdYXWnJ0OePuoh21tlPnlzW2zJAGJq5TPAyqS9v4r7YgJk5SCtGTgo=
X-Gm-Gg: Acq92OHhB7TgoEXMzymBUoSb8yuDtSfUUvkJuB3JOL+6Cq64vq6C4uHU0YVg8ivbYw7
	3v7ejgatyCM+P59/ALfswW06RGLNqcudPzQmxiqvP+AnVlYZOEHQucmzwwLaWjBnllk3SVizwsY
	1CfroulZ4V3H2dhY2vMibUZcw4Spztfp3kVqxTD+70VrruryCt4X1XHyzHv1p56fuC/KVzhszqK
	L4wAcchw1CQGU5YPoXa4cZ3gi9EhcKCDUzItHVUL95QuhKOm5INj6o5jozs2bGXuf9vXbBpall+
	ztZYmwFb+7TLpFsZmRdAyBHwSFDKFKl0acV+hf6JFsmaPCgdH9vVYA8VjJIlEDTuJH8FlhdnLwX
	hY6x648Yk7NR2mr83udxKnzONVyPmbFQ5+K2cTW1bXw==
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719570c88.25.1779901455912;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719548c88.25.1779901455346;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aa88eccsm10819104c88.9.2026.05.27.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:04:14 -0700 (PDT)
Date: Wed, 27 May 2026 12:04:13 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <bfap4hslksgmfosoy2c4g5qgrhk6ofd72e6f3f2qxpojey5yuc@74jvqlfe3urw>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a172410 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=DOyYl3NULbmlVlinG0MA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE3MSBTYWx0ZWRfX6V0AS0H5X0sa
 eVPnhrVQJmcjr1PUo1M5NhYJArG1RxNmQCuDBRENmGlKrPN33lNRS1DR1VocCNKdfDQdikDYQ1b
 nA0kzlNLear67pLFcTI7qkx/qe/Fv0zt6wGFNKDc3z3hdPgwEd8bbrylyoA+OsxaJIC1XQ97AXG
 G4yGtgjjzjRGcGqtUgW7THcSUZInF9gzUfoooY7qwFvX4/usPFH3yGr0COFH/TTVmBGF5mq1GcV
 h+X0gUD5Z17UZ/OVpPbyAuznQSIYyttrbjLVxSdIZAUIhBgwjGVI0+vU6/7iBMqG+vOaqMyxqM1
 7cYbAxWikEC4SW0CfS1a+VXQUtjHKqKEQxXbezrbqSvQ5E9Ld1AHV04LpgYR8twtoX9/QClpEkV
 2Oqek5qzU5tEBeZ3aERARPFkkQsoDjaaZuBxiQszxDMQob9NKipFH6bpzvUGg3Fv99y1n2FUNkn
 Rc2CW7OtnM4CnrkTQoA==
X-Proofpoint-GUID: gkjbmSv62BDl29ECUTiyMD96SsTgUGpL
X-Proofpoint-ORIG-GUID: gkjbmSv62BDl29ECUTiyMD96SsTgUGpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270171

On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
...
> +	/* Zic64b and Supm with PMLEN=7 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||

The only mandated RVA23U64 extension we don't have ISA string support for
is Zic64b. I wonder if we shouldn't add that support too where it would
have a validate check like above.

Thanks,
drew
