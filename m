Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745966;
	b=TyWMgRcC855iOvEM/zQBR3greP6VeqxFveHGCHgvycsyyfkWDiRkUIH5Dr9f7lOlFB0k
	 FHPjUn/OV6+p71yYxaM4n2eEpQx3Bv52Dj7kMB/G2y0tQMjPNzqsXnFCUaAJfZdoP5XAN
	 JktIhSxuGhAnJNcjNqf9H1RidoeEsezqy6T1rzVb4CBig0cG1xOc1gXYExfX3s6IiF1k2
	 xvywa5BvX+flnhpJgyPbfvz8IaLwhWWyvsYUlxTONhSRO/7o/wT2lnVwz2xmz7udNNbUM
	 wxbjkerMe7xsdSRcuQ67vn6DaphPyAyUbIT4U6V56+npxqKPh5DKRHEZFDaN6ch/JnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745966;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wZJSrGh5IrBV1BhaJc5SqNrsz7GIeqILa01fxlOsORI=;
	b=vOqx4e/By7EfzROiqdUsfT6+lA8i7z5qNxel0eGlUe4/rSizo0Bi9JgLCIEyM+XTBvNn
	 FFhlX3RPlZtcjUy6rDpIkev3HyUsFClzDFwugjDR0fyznNqGLZCWcp5X87NZBHrMs3S1R
	 /B+AeF5jI1NRPNR1YsdZnhF9IosTXSOJKDNF4fS9028HnNeDWmn7gRwmTMSxmiaIjqyPi
	 OjakQYP00/OaRWvM7dSCGrCWfleGxqIZlXtaadj0WPPt0bmAKfcuYID/pJYv9mcJjKYdd
	 wEZ7WSnKWBL0oXloUb1UIF0d0U8IkeiKgjJZ/KsTcUOmL2KsmQEcAaBNbkOkv1zpejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=oiXkSJZ6;
	arc=none smtp.remote-ip=91.218.175.181
Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5C606A31F
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 08:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF5C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=oiXkSJZ6
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dV05KDDCuF55jc1yT+6VA3kaUgOJOa/iajAzfoD/ImY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792745963; v=1; x=1793350763;
 b=oiXkSJZ6+2FCHxMUmpOe+6DDKvtIQwfBRMbqvhhwqAbE1s6fds5RUMaJy54NjBCvtZaVmRoG
 JCDXWoXzRtGJyzli3kFWuiscXHp3Khp5nN5GRZwbVAWibc4NRGWuqspKp/YVarbDgAQxm1YfjoS
 qG6yUd96gWWO3CeCQhXjKTmzPUFnMu+P1uYtC1ZYBl1YJaj+5bv6MsvFaGwtNgmF1iK+Jxt49hc
 ekfowYVRjxOLxakxVkiRTWyjO9Oo6YwbsTclf6pDut06yej2u+KnvXZ8PwGxCHngaAb56a+pzh+
 A1W05VukjwvDSUdcjLlj+rKdWhGRtuv7JHVwH8h9yLw7A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c1826811f3c4f44d;
	Fri, 23 Oct 2026 08:59:23 +0000
X-Mizu-Trace-ID: c1826811f3c4f44d
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
Date: Fri, 23 Oct 2026 16:58:36 +0800
Message-ID: <8cdaa5708b92e35cc2d704a8c90d1a27fa842819.1792745468.git.wy@wyuan.org>
X-Mailer: git-send-email 2.56.0.379.gc618271300
In-Reply-To: <cover.1792745468.git.wy@wyuan.org>
References: <cover.1792745468.git.wy@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The credits of the contributors are saved in the commit logs, thus we
don't need to repeat these names in the main text.

Remove the Translator template so that we will not sprinkle our names
throughout the source for every change we make later.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Weijie Yuan <wy@wyuan.org>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
---
 Documentation/translations/zh_CN/how-to.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1e76..d448ae69e48c 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -203,10 +203,6 @@ Git 和邮箱配置
 
 	:Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
 
-	:翻译:
-
-	 司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
-
 翻译技巧
 --------
 
-- 
2.56.0.379.gc618271300

