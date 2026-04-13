Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F80398918
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066260; cv=none; b=qjngy83q/KQffxSzJTWYrwIvbEVxo/jASO9dexn+E7GfujjCRYndQ1icepCc2PIU30CjABQyZ1WS7FVyVe88Q2fpY4j/4YK503iYh7DB2ueQJLMkYj1HQ5KJQwdq2dzTbXK6nWAxriuS0xXYrQvP0wxw/SlqGDK6D6Y9WZvQSGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066260; c=relaxed/simple;
	bh=9+/eeTgyYS/yzTO3pnqexv4gWy07zOtf8v7RwgZqnq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0y+kdl4XNoT6jxeYf1VYZ1BXKtm9eXMnO996FCfmP+x2/etQQXZ2Ely84ca1M7YO086z4KGDlXQw7yXyBZf9GIJKtlrQlSpfrx9T436qP36jHNvPSXe6aEVjsy+QDSRs06599+VVBPtbEIQhRVOFe/SrsMRyIXZWvCYT3B2qu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc2xfMLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2fmIGo9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jc2xfMLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2fmIGo9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7ddgH136227
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jMDYT8BNhIA
	8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=; b=jc2xfMLXQoJy0Jjx6xJ7MvmVwKY
	RseI8gde1K1ROLTbSHC3ZLQhfw76IQEiHlNh2OnDxNXMzXGtKeXLW18mFxu5OYf7
	85BqqrM+nnNole7Pjxq/TlVwmdbjqd3kNlbJBRyXQtDJPYfZomS6jbh5Aoy3Atwh
	r9h64UgCW+NTXXviuNfzosa9YisKNHedMaKnC1tuh1b4tPlWkQqs0tAIUuIawwgB
	MsQwjcK9HAID8y5Sc+zx864WYAsnC/ll7KmTWPlkRiaQxuZUGJJgYWbnF01aZgQ1
	zfG3iyWmDlY0lWN8FU+MAVcZJ9qpPS7YsPnBTo0/0Y5rD5FEAvUaJhrToMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvayw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 07:44:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso78139661cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776066257; x=1776671057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=;
        b=K2fmIGo9Y3illmWCrVXaqP2mjIf7f587GoDJk3/EImEmWYJKUTL8KyROg94QKgka0k
         +S0UO9jv6Q8hdIrLiTboyM542jnC0CVmx+SzJiFcquIqH9Sc058BGNzFNFsuyHK49wsE
         8pR6oE4I7Ad8+wav0UCOwWFFb3Di1l5r4tiN1U/W66+V9WVjTP/0RQG7MyP57TRNTcMC
         qC7mGoqg84PmboRUFzffud/1Q6IKOXm0zJjC0d1KuOp5i44Bz2wwjub/lqQhXvWSahSh
         Cw3IOYGBCR92Y7J2sLoLG1rMN6xjpecuCiK3VbtshT+nfjs+rroXZKW6P42xw1unba+u
         ljLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066257; x=1776671057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=;
        b=YZC71uo3D1DDQbUvo+ocxertEn1rIh2GvPhDORDaqqp5fd2wpcQ9wjtD05UV9urb8L
         t2ptlLdvu29CFTKtEJ4dZ77EeUiKpQ3U4onRlskJrhtqlCP15kevsDNhUZKqXA8MCcoq
         mvydb+dfAm4Gj4RbYq6BVK6WB2JQ9s+Qf4ml+fXvh0C7J4qnwJteAUrtz4s7C7qLme+J
         hF093/vCWmgGduSTbkWDH5STVQG7vP9YrYGZeOkBDBvm3dj+pxL811VSErxq5bPbTVZx
         D9AkD9f6J49zTVvE2gyp/pN//1fJLxPh1/eQq+eveKE+kTBiXK4AbY4nnlPz/MdaD3Jw
         wRUA==
X-Forwarded-Encrypted: i=1; AFNElJ8CCD/sWoXO90MTRleAZiIeVj7aeFAotxQegJLTczm3qzvD+bb/cbn2iuCQkJI/w2ZQsyzh4TPVhnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nTj5tkaH2J7H7+I2a6h9XGfs6BrbJ/CxJSbHahFDqo3KWdro
	kCytS1NXMXnIBmIILOSME9RXhgukVIM8urX1fALZdeWsTzFJNwLyr4R0Y5gAY+xA6LAwh6965OY
	pwHRHhnihA0AN8Pk/ELt9c6MtzUSefCIHTCRCkrQxUJdFmbRxzy56pcgsvj2ETsA=
X-Gm-Gg: AeBDiesD58y4Z83a7wUYFK+HrCHxObrEXM96/W3MC1FsXLyyuxxPsm53jIUbCOluPuC
	P+tMEMP77si5weDyvK5WOOZ0ZIOUMd2T4mP8U8DSadrtlqptNCy1y3PsfxiM6iSeUohX6QKSEmW
	hAxuK28I7Siia4CwAlbb0wOaenofebxYnIE0xORva/3LMst+IPaYwUC8bNoAZfJNwTvvYZb8mvm
	TSFwcrKfj+f9yZddD3cC7iYUFqTTZKLPjNwfBT1V6MzHKVFSXUUdk6yJjR1QKpLu+5AjMceoC7/
	e5Jf+b0lN/GARQo8qpVFCydV7GcP7s5EAQfVawf1X1n+KaJ7s78d5G6ZFnImx4dQn+AKbmMnojx
	tQ9s61LqzrmWWJ9UynMuwVDiql9Lud/v4H8jX
X-Received: by 2002:a05:622a:11c5:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50dd5bab443mr185499561cf.44.1776066257568;
        Mon, 13 Apr 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50dd5bab443mr185499291cf.44.1776066257139;
        Mon, 13 Apr 2026 00:44:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm137465635e9.3.2026.04.13.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Document purpose of defconfigs
Date: Mon, 13 Apr 2026 09:44:03 +0200
Message-ID: <20260413074401.27282-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9+/eeTgyYS/yzTO3pnqexv4gWy07zOtf8v7RwgZqnq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3J7EJHjlEZXYb+iPxBermj9EsVFEZq7Qk22P8
 OiDqazIySKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyexAAKCRDBN2bmhouD
 1y6hD/47MsD0PcTGJM8sGmIHobgom/PdUcdZlLirII1VDDJpyXDTs3PHiezEKdoCNSyztcrMsXT
 4oHcTnD/X77Yp3yiQkK5xSwHdQoR0qGwgi8Hg4xHeWmwAoUeaE6rAt/Uet24wdZpfzfcZCduoc5
 Ys3VpGnXHsY+yUt868aAFzOWdqfuH+LC4JOqNvx4KgBINBjwi0QXoHwYey9MJ/97ayMEcbC38Mq
 f377+k1H/ndRbs9bRJoRFhb3vdG5rPwiUBAYWYmoENwxqLmVjrSqkf0sFnRhoG0SwrGslud0ShE
 t+4E1HkALxOeqLE/obi3Z6TRKz+z0dh3Nv6QWLJnoH3h3h2jraDW+VGHDyL27zWjwPqbgwhjIb8
 zJJj9piSymp8nMPSPUIKt6bMV/g3/NfGVUqnOLBsK0XbJQP2cZKQ7eBVRX1w80uckOcJOle5jop
 BVzvei+HZMU96eld6NiEIlqUUTHwLMh5jszBBNgFakOTnBMJ4qnIsPQluJnbZUenmmbe3/PoAqc
 8O/QpKxKBPAFvPRlPXmh95SlRUPhYrB3nZXhirvnwP6Fbv4juHtZDBNJ2yfuskRA6ed7M5P8SOc
 DvkKDfxfifMUfHlL7Cb2WZJaSzSb8o3mqB4vDn0fC4rW2gHkgLqwkU8kP0xIxapmNKNdTZHQaWt 9QhzkBoVibNtu6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dc9ed2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Tz5aH96nyyF_Xlqy0V8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MyBTYWx0ZWRfX2nFm9sxed1/6
 LZDTUZnRpeGXfkSIDUVj384z8O8quOrZmJCP0BoagSwJIIirEXIHZH56vE7tabtKrISgHk1ooPO
 npYL30PTYREr2+dYQnQbATrRZk0SA3GWxhctKtiTHQeHvRAFmPWpnK/Kfa30JWlrOSW0ElDsYvM
 AtqOL0+dtikJfFwHtGi6ixW4J/FWsMNd9/fglUh2cqpOd6NBQHwBOg5mecblumYEynpNRUsd8sG
 ZF0xH686KEjWYaKg+cn15h3ijX+ZSgQXOwGi8usFQw3dR8g0gmw3jYrsi4yEokA/51cgs2fsAfU
 ZNFN3jrhp/+jO1DjqhpPUnsg+9nyPteIZKRZkZL8cqPDQi1T23tG+lvdoIoO50loGcaUi340ZCJ
 EAs294v8z+JVXYGVvBwjufqxncriwo8DrqZxQu9MFMPTITh8dGLQDJeLFBBoVO7S1r/o4r6+CO/
 GAR86WIrGhF4Ndn4HVQ==
X-Proofpoint-ORIG-GUID: uvt2VMJARwCRWhOqjNcEb47Q57Vw4BWA
X-Proofpoint-GUID: uvt2VMJARwCRWhOqjNcEb47Q57Vw4BWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130073

Common mistake in commit messages of patches on mailing list adding
CONFIG options to arm/multi_v7 or arm64/defconfig is saying what that
patch is doing, e.g. "Enable driver foo".  That is obvious from the diff
part, thus explaining it does not bring any value.  What brings value is
to understand why "driver foo" should be in a shared, upstream
defconfig, especially considering that distros have their own defconfigs
and we do not care about non-upstream trees.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 4029dc6938d8..a3a90a7d4c68 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -207,3 +207,13 @@ The subject line of a pull request should begin with "[GIT PULL]" and made using
 a signed tag, rather than a branch.  This tag should contain a short description
 summarising the changes in the pull request.  For more detail on sending pull
 requests, please see Documentation/maintainer/pull-requests.rst.
+
+Defconfigs purpose
+~~~~~~~~~~~~~~~~~~
+
+Defconfigs are primarily used by the kernel developers, because distros have
+their own configs.  A change adding new CONFIG options to a defconfig should
+explain why the kernel developers in general would want such option, e.g. by
+providing a name of an upstream-supported machine/board using that new option.
+This implies that enabling options in defconfig for non-upstream machines shall
+not be accepted.
-- 
2.51.0

