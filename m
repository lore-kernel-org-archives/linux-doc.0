Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D7C41B36E
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817802; cv=none; b=IS2jbEwHoG56jAE+MdQqrV6gii9cYmU8xYe2UhaP+j3zGMJE4u6aD7cTfdRtGFFOryq7+vgDAC2RsefarA1Bt7fEjnzXF6xvDdxU743DGeoaqqM6b6CvHtd1ZtwdfIatRnQa4vwPfRwr++Z6r60wDEpHln4iWFlbrqIXphBuefs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817802; c=relaxed/simple;
	bh=8F2/35WvpX/TqMubbBTsFRZjI4ctiUcgIyYIkq9cGII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnwpXWarzFSIm5SqtTwgz9PlvxmIennnJsoMqAxTGicpl8ds73ni6YVHZ5MEaDqDUIHTV/7Pl+5OuLyicDetANpQ1XTGBzoMKyzAX9/owAk9a3m4WunGRV64s7OlPf8Zida0ssBcIqw8n1XYYXavH/Tok3HWxaN+rmcW6dn7Vxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qg6g3Q5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G14D90xt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qg6g3Q5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G14D90xt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1cYr1343462
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajd8fwlcy0ukV9JCrBK3xVJx+7J/zUO5UQPSfgWVqOA=; b=Qg6g3Q5T9Ua/tC/o
	4eaxN8sTSu9vZT4LS5WTwUwkKD+T5rJRjn9QuBKbGHSwXzO8SZMIfvV6iHpA8xpk
	kBBUM3dtmDjcIWP0uWS3Hnfc18OnQfUbbORTdSYBgNQZSU7+gIJbYlyCFJBN4NPR
	FdL6rncX83TW2FAk9kb7NRDzfyVHtM89A9ar0IOOygPh0nYdjuaqQYmXvYIRLAkS
	i1krxDfDw1iUh/cBAZMqhbq6yV/9cXZNyeo83YMYlKZPH9hespE9BNM9gup7cTA3
	m+4z9OSujw29ipWHK71hcTNGOYOt90TxbwSXF23N+UWVzPLF+U9HDf36a7jFEAAg
	75ZWiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2uqr4ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb5359e9d3so5641329185a.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817799; x=1773422599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajd8fwlcy0ukV9JCrBK3xVJx+7J/zUO5UQPSfgWVqOA=;
        b=G14D90xtx8vPEQlHfPPESOefVcYhgUur0NwT6FldhKoECbqccSA1uLDPJjtCytN+aa
         FSQ1LgHeGBROm7EvmPN33hQ7X7+PJTZicRU01YeDq2y3e2PIe+yrel/tNwxoBVLC4xqK
         aK/0bKf5cYpFu5olMyjGi61u7uUgAyn0kGUp7YQatAE4pYOKWXhxp+Z+4v0JRJ075Y0+
         +w4f3ZPx/xLG5GAWLOhZa/SlwY8qlPqLbXah4/jgdlq1+9s/NSHF2h502Hyhq8fGc+5h
         h3HoNnAegf6KFcQvVjtPxN3N0hgKqAy915m311KcFuMmdbfYQYvhdbQZxvNFNz32Sb7N
         Jpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817799; x=1773422599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajd8fwlcy0ukV9JCrBK3xVJx+7J/zUO5UQPSfgWVqOA=;
        b=w7iSuRbhF0DKv/fUQTRcA8pasIbyacHihMRcxF2Gv3ZzRwR17+wb0iC89Lq6uBhZjo
         TxDyIHA/YolqiCOPfTN20NPtflEbRXuUynfyhxm3bE/7F8aAyOeF+7qEc6OSId8p6PkC
         IhujsTdyy8ghuJTN7Al6aH4uyPW68iHpOUpeQCt3gWScWcFiMu0TUh9UXiy/f56v+4uj
         lye8mT9cR4C/S848Li5tXxH0unF+FsxNkg/vneGKXNMCr3BImNOTGDuuVmamEyHdR6K0
         2y4heb+l+darNkAp/jHyiik5ALF2PflQNwCXHykO4MSPBuV+t334S5c/yhkHc+9F2iFr
         P4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIl3dbrLNUyhuDlf3T+dVCN0lyniysRrX06PazdeFxonI+M0cuLL5e07QiJcOXKHgOlsWsw0OCvYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC419LJtp0EmQKioOEQ0/JZSp8fJdV1FoKUTpQ6yl1q2jfThim
	LpININ8jRGPOO0uSQTgbCuXfWzQA1xeYj33XtzK/fJ5E9oXQDWjUhjD9boRjjdDnNuMd3lS4qKj
	Nzl5G9ncagHN7LVNhM4bsBxO2H+vXIurXNb41KHQV+D5zTN3CNYMjVOz7XTT3mOQ=
X-Gm-Gg: ATEYQzxbrYg6ZDSDKKccFESkSGroYYgptSu5WYAzakkhCLbneBk1mO5lwJzz9s22It0
	gSWK4gYP1IaADWMBY6bwQEplKKzEFK6i/GCctpR24kjpxLA0FIV+fSy6hJVfWL+pav7dWGSA7va
	/8eS2yLUPlLcNg3d3Vvsyrvki+LuahhM5C1c8pMwBgMgrMvxVomUr/8x0Fg95qyrXrKbeNDBmi4
	wkzSDDYyLU56erYrYx+b9mcJE611O4+5+NyChPT7XwTByQ2CmOsdGraENarGJACZuoQsWCO9fh2
	xKeG3Dwv1LDG6jVG/S6iBCGN3s5+5f8iqw+UaE/w41/t8IymnjoMkqi3VSe0t8tL4fYRt/TPGRj
	cDP+MQgHPK9Wgq1nXN9o+7hw9ewd+P7ditVeO9afHVQuIUyPpyh++
X-Received: by 2002:a05:620a:3911:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cd6d336019mr361482085a.12.1772817799534;
        Fri, 06 Mar 2026 09:23:19 -0800 (PST)
X-Received: by 2002:a05:620a:3911:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cd6d336019mr361479385a.12.1772817799131;
        Fri, 06 Mar 2026 09:23:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:48 +0100
Subject: [PATCH v3 04/14] reset: gpio: remove unneeded
 auxiliary_set_drvdata()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-4-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=827;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8F2/35WvpX/TqMubbBTsFRZjI4ctiUcgIyYIkq9cGII=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw11H+sATMLButuxUXWY6jr25BbQ8nOcydV9f
 Os85570EumJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNdQAKCRAFnS7L/zaE
 wyRfD/9ZWER9foHaSurD4kLnaPfy+0yEqwFOMcg00PmWWPjCL5Db1gsu2L3E/KndTCKa2tseIlI
 nZH9P3HQt1LU1x4rKgZyVakZLSAKIR/vP2GgnvacXe2yvMtQYRYWpbFbYbI1xy4kdjmUrfY/gth
 pofEcySILOdCE8+o5MUshAulEVaBx36qRqniRMIjKzX4+etRhqX8Nkn5Lga/vhJjwRMaKxdvj4g
 uZNsONe15uE4rSWPMAzE+O8C7+5SNjnF+K5ptFabGQGZ6UKa69JnjOLxWbdVz/LcR7vPBugMO5r
 opgqvxE+t6VzXUqwTtwwDxwPYLwc493e1iz4mxeaQyIorSzYx6I/pRL4FivVjMGPziaTpjUCb4O
 Zdubbxv5ImG4mnGNE+t3z3qvt8snCjOAsUtWmNviCNI69/YqP2EJuLar1s7YTP01IjlWkEw4NL/
 FbKZKK+zDq4WA8/sbP4I/krfXrz3j7MSpoKsXM+zHxN8i/0grr+sGi94aIqZd7gaHzouY0n03/g
 Bjx+oy8eW/WXMyXxrr6Wh/pl+IwH2SQTGBwL0B4qy0ZV/1ZYjEY5NH0SrzuMDu7SJ8+TttcMA4/
 Ha0Bl6h+lSIbse+tvUvgaqt3vxXp7BBjLKJqXrVzrgsc6kUgd8Ul7NKFfJmz8gYU46d+NNlQBgm
 eev5+ODzGoBQt6A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX7PJZpO3XvNC1
 w3A/c2R+1+cD7PZLwVM6luyPaK7dZYkKXepzRfIkBO3zWEJvphGvgy354N9ZyGSA5qXVqK+hj1D
 8AiDpc8f51KZSmT2pxwfJZk+7It9mCMeNSy8h4oKSq4c5TGbFE8HGEfiTvF2qX0X11dBt+lLG/3
 oeiGJ+ACxxH/HEfiWO7eu3P/MxIvA6R0wLHsyaVTCDbl4iEFiLozZEBmT+7qGejGlwYJmFOnChE
 3+zZIcGnBP7itJkwf+0UkIQJOVy0jMHobwTtl5uxF1qnJ5gjFuvp4nP/+T6PMA++goXnNoO7rI/
 ZIp+P0eQ3o89geD/qussFM+EPoEgs4/mfXyi6XRqD0sstgVCx9ZT6NBjCV4308sEcwDOhKSETM5
 Hj7+4fSWcp/O4n4pa4Bf0+oNpP0eqi/7qar3W2CdVM6nUYyPJ0uBe8D4KebZEh4ugqhrlbhgBG3
 xgoMtYW+A7QW4Tbo3wg==
X-Proofpoint-GUID: vz_OxpeC4sUnOmRuxgZRz661IbEORSDT
X-Proofpoint-ORIG-GUID: vz_OxpeC4sUnOmRuxgZRz661IbEORSDT
X-Authority-Analysis: v=2.4 cv=Q+HfIo2a c=1 sm=1 tr=0 ts=69ab0d88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=X4VvQV0HAJngfktaq0kA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060164

There's no user of the driver data so don't needlessly assign it.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-gpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index 6e1c4f990bc0e54f4a47186340cef03b1a2ee29b..5044f809d0e59a08861597f4aeb685e95328c2af 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -62,8 +62,6 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 	if (!priv)
 		return -ENOMEM;
 
-	auxiliary_set_drvdata(adev, &priv->rc);
-
 	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->reset))
 		return dev_err_probe(dev, PTR_ERR(priv->reset),

-- 
2.47.3

