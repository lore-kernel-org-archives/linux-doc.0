Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6571A4F3C
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656537; cv=none; b=iXOHrREp13cgD6td6rqYjys1hPf1kp1J4COFUrcbU3cGEhuweIJq8o6AjJlBLr/YgF/PiruNnJDXPnwsUgoIp5iFk6v9H83UETU9UWVkRDUg2Gj16avT95YohxNAx93lPi78sn67dmhETvKEcf4V0tdTyVP83KWFg49W3PW9PaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656537; c=relaxed/simple;
	bh=T2FqrpE1nQ5/IBWZNdhUXYsltV4L0V+EI0OVS5NLa80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/aQvapOVECDICQ/afF99MbnY1v6PhVzHKJXZ7FkIScp8253qjP4zFmyr2tY2eCwhAuOmyEkXwX1vlB4WMoQLUMrWZKPaP70jrxseVkVBWTky42efFhgjc+ZCrMFBXrpSHjbi80FoV5kAV/GzrXfOsdu5YgnjTrBy3Vf1B4R9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrIHEK6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKPICxya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrIHEK6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKPICxya"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638CgRMC2861287
	for <linux-doc@vger.kernel.org>; Wed, 8 Apr 2026 13:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4xLokYbX78NsG9Sr6J5EhKpNbCDr3s6HqJZoGPlkm0=; b=IrIHEK6M/Lj/wsV5
	v7von32Eu6RWU9/pEBe5rBg/pn2QvAM6BwRBcz1mAZvLXBsuyOP6EYlzRXJ3VTkP
	fxIZr7EEJX0vFj53fWcxoUUqK4wh9cSW5KVVwMGrG6QggsUlsIl8DBA2Ridy9RQI
	wz5UtCDMdiRnm8ZYUzQxf2hWsryD/m/Kd6GwJSCU1N0xuj/zmwQsFkgv6OwJnSu6
	PkJnFquq3EyKUxBcuADj4lDZlLa9thDrHB6yDgnOgcoscRZbm6G8rrH23+XoeBkY
	Lw+ADq+pV206x13c9uMimHkRaAu7QSZyHh7zyJ7cjKqTjxJOiXmKPXts5WZFpLCj
	xxBpHg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8u3vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 13:55:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5aa81907so62268851cf.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775656533; x=1776261333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4xLokYbX78NsG9Sr6J5EhKpNbCDr3s6HqJZoGPlkm0=;
        b=VKPICxyamnCsIQ5cGYM4QlrD0LuPV63Cv7JjfMBsZTTwA357bwd/0zCMiJVxePrXeB
         cIuV1EYon3IG6/UvCzm4VogAdfkQ9ED6vuXj83DTkxZkgOrLuIcJw2SnFo9SI0gZh9fh
         KV59NKZ4u+O1ildp/e7mKZO4foTNbdJoAT8IG4XvMdeKsURtULyiQlbcSAghE1Q8HpVy
         UgdUUVY50FfsIwrCEO0YaMEBrF798m2MsMYhL0Yotj3xGH+Iz7INi6Bn0KgwkdFCBfdk
         17J+D0kGpSezzdCYDb6xRt3WCTgW0K0TUHR7nSBdGJujdmA0cTsSSekzAwbqIKW6C9Wg
         ntUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656533; x=1776261333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4xLokYbX78NsG9Sr6J5EhKpNbCDr3s6HqJZoGPlkm0=;
        b=QgU1dPrXQ5c461++uO9/kGUsfrrv/D9kpyQ6osSqSzVf0ikyIwiE9Cozs5iY1q60br
         2N5yp94qxnlAaSGFygt/PugOD9YHj/my9TwSxU5ovo8Ui3lQ0PrjeHScgQMd5rF8VbGq
         xn4VNJ6Zu/80Dv7iNHCuETTCkaDdjQBONzGI8iG2+pwmWxVgTnj9x+pnRZvcyokSpnZ7
         3PMnjdMT452frd0xWK+GaKliGXgWklWW6ZBlB64jDCUG1gk2WKm6KDo10m90oMdUsXWY
         D+a5+vyb7owW3msQBJEks4ZwwK8SwJrP9jp4siRjt+w4RCaOtiN7I2TThTjtrR3w5WCH
         KGEw==
X-Forwarded-Encrypted: i=1; AJvYcCWfQvdXIyDnKySfw6GlSpESwNLoKAiMCGBmU8HU/duLjHl+3w5BnKdFu1ejEzQisoiWCaPrYGaE1JY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnN0bO5/j30J7jH7qVR+BduQ1hbnWQ6aqiy+s/dbCquGSQxDg
	4lCElCSHd/Lk7pVsGvXqwq/6JDwu8vxMd1XE72J6mAtVzsCPEXbaNUThmIdz08znnIgnjwJCZpe
	fhbmhf5lq/p23oQ35HW4dZqeLIOEIHQLrQcpeiBJup2ua8AjohjT49SVY1bH84SY=
X-Gm-Gg: AeBDiesRcVcMMAtohNhVkitFVJyuodWylk1C5QTl+UN2rt41ho7G5EZA8xlxjsnafup
	9zDTAeQF3yr6DRaJ351XPa34fgg+YPsVKnEufFmfbFO6wu7XYIEGdQtDrRrU7UGeTTwZ3f8BmYV
	/a33uNjRi88ptmCMXepI/t205r30QgF1xR+Al21kidUQLeOyQIYXA40+9c/o9ktCCBSj+1/evvQ
	8zB/ilzKer3yc3idJ7se3tLw0eWWsiAkWSjs8qWi6dwV9Cn8WwpTKodLvM9sp6muvn3jUkJA7p+
	kda73/2lXKbNdj2Q/Xb+RWtw2EBqLB+iTsJvB3SC60QNwJKmyyw4h2tcaODeR+ZbGdYXZ0DuRLo
	Gp/zYzkZbvsSKdfhiF4XNxKc12/rUYENAbLlaWlqipOJNPtIui5w=
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr281194171cf.48.1775656533488;
        Wed, 08 Apr 2026 06:55:33 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr281193621cf.48.1775656532915;
        Wed, 08 Apr 2026 06:55:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8384:d958:4b9c:49d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm60653168f8f.1.2026.04.08.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:55:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: gpio: update the preferred method for using software node lookup
Date: Wed,  8 Apr 2026 15:55:29 +0200
Message-ID: <177565652533.25403.6279647182023858359.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
References: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qGvNhd8XdltKA6Vn4FsHRBAVDo6jNi2J
X-Proofpoint-GUID: qGvNhd8XdltKA6Vn4FsHRBAVDo6jNi2J
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d65e56 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VHV1bxSRZQlKidfD:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOWvFa88cN_o-J8PfnkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyOCBTYWx0ZWRfX9C7cP+BfEgbF
 PBfYkxREAMJDWcrNLeVKjRHPyFw1AWS3ou61JutqjA3AB1AKoGbp7P2/tB17qdPpE/q0Q3FJovr
 lpOcN+hU4nAktfMlElGxG6gaghr2Y3vg3mfDH+7MwkwfY5wy8In+G05zDse94IfjNzY9SX4H6va
 2uIX1ynR5zW2saceFQbKixombIryqpDyK7KsrtMSld2ZLjg9TB/l/Jk7hbjik2DwJc6d9mgRx/K
 wgfBncHIaaCYj7w5PdJ9rCCYUyDT5RwrFfHW9DFdLrrK2wSGg6l6RHcf4YWutBzQejaH6wNGe6Z
 +mE2J9G7FvKQP5SaO085vyRYu1TkMJjL8dq5eclglCtUCIG4yhatqeBcvob3C2CPYSCc+lDRM28
 Il9mcHOZ2fI5PwOB2DTuCLG4Sm/ZHGccj7r1fGmhDwOVHn1pTfaBWN1B8xPqyagnuxm5Q/S3iO9
 7gLY1HMf/H4aiY768YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080128


On Fri, 03 Apr 2026 15:04:55 +0200, Bartosz Golaszewski wrote:
> In its current version, the manual for converting of board files from
> using GPIO lookup tables to software nodes recommends leaving the
> software nodes representing GPIO controllers as "free-floating", not
> attached objects and relying on the matching of their names against the
> GPIO controller's name. This is an abuse of the software node API and
> makes it impossible to create fw_devlinks between GPIO suppliers and
> consumers in this case. We want to remove this behavior from GPIOLIB and
> to this end, work on converting all existing drivers to using "attached"
> software nodes.
> 
> [...]

Applied, thanks!

[1/1] Documentation: gpio: update the preferred method for using software node lookup
      https://git.kernel.org/brgl/c/d129779da5e3f8878e105fb3ca8519d9ff759a91

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
