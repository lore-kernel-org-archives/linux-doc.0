Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8431378800
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047965; cv=none; b=cCtk2rRPTa1usk7nWBe9bqJjWAswHEnFMpVg7U5aBcxpzKe1QOXavB1UJq4IVp0Du0zZe+3yOe2wjx9iw9oiD861nVGWtUX2eGzcHyika2ZwO7jhQoFOSWbmC2gsVE49xhBlSQ3EPiYRhlNoK2OM2vp5B/No4v16bmKBfZuIG1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047965; c=relaxed/simple;
	bh=sWYxcos8CMroC8A0lEd/tGK72D2EmXzR79qIMS/1B8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGgbheGxg4HEc5lKYf7dcXDYUO5uVDUd7yNk0wTWQ4amz4MgzGYSXTaJV83YDf+Gyvqa/VN14hOiKHze0LZbgMyjBUSnKwuQqzClJl6ZJxsfmqfPMMIGwj0e35Xq0lUN3Cw3bhVP955L0stIZiR9k+lyRRI2NJpOGfuW3MZOcec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVF/Ebxo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+KYAKGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVF/Ebxo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+KYAKGH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298FE7i2697191
	for <linux-doc@vger.kernel.org>; Mon, 9 Mar 2026 09:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FHXZeFzUeyWtXo9cOsbCZfVzR7z7yw/JrW7ploJ2qc=; b=ZVF/Ebxo5j0WzHW8
	Om6ekYQlRbCDxrceniKGYKNM+7/P53FtG4qFWmMZwkrMW9vHNNsyj6g/ov9Sg4Ni
	452e6zFzQdaox6/lTUn+sKakw7vhIYZBfpGD2Yfy17ogtheyTyKtZjdSzf4bKoCS
	OHPr4Cwf2FL8wYYmIDPX/d6GhPdJ/tcNC7mo+BY6noOPt2R4v5WjjgKs5QMZQTUA
	c17iCzE/CIKTFDWFV4TqExpQ+LNHnalFNPmv/P4u29WusXN8j6r9k3/Alq5kycPq
	cp4RaTvXrviDPM/kNCIRqLUxL89IHSvn1+uqyhH503+O/pJ6C0V/ufOIvFWrvgtD
	FFcEMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpn124-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 09:19:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso1301097185a.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047962; x=1773652762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FHXZeFzUeyWtXo9cOsbCZfVzR7z7yw/JrW7ploJ2qc=;
        b=E+KYAKGHaOauMibN6qQKvKiNDhotLj5ONZ81J38ktCpYv0KGal2jqdz9guXh8vpU/+
         vfhOEqVPzmDXYFbA0AVp1dIy2oGmD4paQR/0SZmgOmAVKpDcbSBDMb4v8hUPYqvPFhMH
         ErYhlNVfT5cUffTznudgNfSrRZ4qbQ05dKn5IFNy8ZJ7byp85Kyo3w3wfDYp31UW1GKV
         otzesbsPtMgT8MJaM014VWGG5DwbRyMn6KBLGOhiG0BnrR7g5kCJNnhB6qSEYe6WNcSE
         GVJ/PT7KI7FLTWuT5v2UVW9ma3oh2oslH5sVkrz12DDMlKqhaaCiaN9VQiuqOmxJ5W2n
         DT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047962; x=1773652762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5FHXZeFzUeyWtXo9cOsbCZfVzR7z7yw/JrW7ploJ2qc=;
        b=Us1eWIH82134iwuaGLdmMf52CPwIU5aLGYooTB5G9X3aEaE9pjZwSYBZ874UnHaEni
         zkrxOD7QxyzrH+82sUfPTCQDTJgfQMhkS5dyacYI3gIjqxdLS3zDni+RGoX9AaW082mX
         xjJr5vWRbEAh7PzN5QQq7tQQn+W86hZmsAt1a5zlkVR9HBKZm0OFGQ9IgYsEvrTxVNLW
         U/K2IM0azeQGXCtV4vgq3/hoSvXr1x5soK6cHXaXXV8+6U+cU0Jz+ioqxb56wDR3YzPt
         kEOxhiwlyirImEXWfVI5ND0yDTlXUrcD9HrEhF6SONFd8O0jDRRHt3amwlXiJxZkB5c2
         5REg==
X-Forwarded-Encrypted: i=1; AJvYcCU2NTXxXvLcr9g+UjqRmQPIcIaNFLDdbqOGO75i0hbdBIU+wGJZCYsZKL9ttSRyiAkfIe+z0xMhZPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzZYZNI5s+pECj7bnvUFMhJUMx5StNycqqsgrburdeRbIZDw2
	cJ935g8JL7ifM+vhbVau4Iukvbxs4DefFv17dgYdvpecKHnHrdz2ufir4qSvkzJ4ss1ixDXP8t6
	oJfTXF36A3OihvU8kxFXP2fa1exQm3yfcwGwABJdIYug6zSJa+hWJ/DtrHExb+r0=
X-Gm-Gg: ATEYQzzBucoE5W75JqHFj7FFZDplLB5DjzN/KoK3GapLIDnb5Ta/dI7Yvs7ef5lQoq8
	6bRrvD3Uhm7lMMqBTAZXwfuuN5rvDuq+/NGkSZwwiIv1wzAuLuUEkgFcgFNmqqch5+pqKDrXh2/
	QVBm0rJYLaP1feZC9gGuk7hh6jOw64Uttvoq41s1lMZ1g1zWyWsVoujT6jIR/zTCF/Io4o6j6pP
	yDAQ3bJWRp7/z/FCCzUPxCQq43LVC+zRvu8cccH/sIviE3hhNxPjzPM0KOvJ3/gFSKbap353mjW
	lCj+yeB8tuYeLHwaVG9jO5ZrUz15IsjcSaobch4e8+3pYZkSTsInrx28Ctx7BROtcAKY+olSVeP
	C8HZw3UL4wheRTZ9/vmVPFqXg7x5LzRX8aWCke4xXJG1XxYWc
X-Received: by 2002:a05:620a:480c:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cd6d52bb78mr1199076785a.59.1773047962208;
        Mon, 09 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cd6d52bb78mr1199074785a.59.1773047961774;
        Mon, 09 Mar 2026 02:19:21 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba90:b1dc:5545:17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853252cae1sm150954195e9.3.2026.03.09.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:19:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH] gpio: Document line value semantics
Date: Mon,  9 Mar 2026 10:19:13 +0100
Message-ID: <177304793359.9428.6068485267622762602.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306-gpio-doc-levels-v1-1-19928739e400@kernel.org>
References: <20260306-gpio-doc-levels-v1-1-19928739e400@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NiBTYWx0ZWRfX7ZR7W/6BIaQ+
 0q0+iU7Jr7gAvwz4x7edDRrgiyVa3LUa7aIA1BdhKAuTsKcws2ADrPiAPcHb8hORyA1bjWY4ry4
 3w7zxzZFhQL9hNII5ZW6TvbfKaCIXfkJDIENfefTyULE8RQTG6mWCaIlT2ngCI+V4NqwK45fCpl
 jHIsj+znE91E8VpPxecNfEHo6BMJPeKN+vp9mwP5pwpK3uW+w4HXERRvXkb0UmcwFkmos11KNEe
 sALD920uiwW+0BfXJn8XU7ks94eeikte9nV0YwS2PzthCZBeVAREcr0IBrOZYrx0PkJlz3RxC0Y
 3Rz6v/AxN9eNXPi1kqaSc7cED4mDoG2dFbxvCBlSSPJye+k66dV2dxVHSbNTG/2GRi0ly5S59L9
 5SKDBQKoGmzNyGCPBz1JH7nND+N4uMyqRKDrPp0YT622KVaAACZIWTwJXifMTRVXAXLIiP8tWpA
 JGlYrjwe5UhQwE37JLQ==
X-Proofpoint-ORIG-GUID: iUuH6X9Ij71EDrHZLcBnezzOTKAiCIWk
X-Proofpoint-GUID: iUuH6X9Ij71EDrHZLcBnezzOTKAiCIWk
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae909a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rrvb0uiYveUXytfXFyYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090086


On Fri, 06 Mar 2026 14:22:00 +0100, Linus Walleij wrote:
> It is not clearly documented that the GPIO driver API expect the
> driver to get/set the physical level of the GPIO line and the
> consumer API will get/set the logic level. Document this in
> relevant places.
> 
> 

Applied, thanks!

[1/1] gpio: Document line value semantics
      https://git.kernel.org/brgl/c/5645f805927c9bd4443e6143e487ef3ffea34aaf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
