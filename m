Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514906;
	b=0e03sdo17rscvGdWfyIqsT7LfvfbU8Pvq7+9oH0Itnl6RhSVfW6TDjz1p1F717FL+FPC
	 1PlacWo7aEM7fwNe1CSwnbJBu6jy5fxw0UjgHL9iAPrCKPGciNrOPpMd6ySUf9Zu9Jd7U
	 W45njVHH6tctpb6dQTBewutGoiAnyEzgd22cK8RiK/jpdzBiJSBj5WAy4zVDVPUO/IAx4
	 1nlAYxJexYj6iaSEh7tSdXEuWDDLkU1FdFGdRYc5HF55nOxlzwOwwsAjlH6Fn+TNwqYtD
	 zmxwZiBkz5G3vE2zPGLxhw9YLpodtBSxE4cCDjQKdKUt0d462TkBvSZuqgt4SjIN+jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=xhSrkPFwln1z0C1CvB8gHOAF40FxJCH1JERtb76zTMr8zULrPLA1ORTyLOfMKglbDGZc
	 tkQXvXwY2Ri+3ilopaZxPoUwB3bBozuzy22pOlJG0ZP22R4qVhWHlL9MOfaPjR0FCGUDI
	 x8YO9sxrFzmq//BY7vX2CHn98AjEgiBZZR/FVfv8uquQTNTKDUhkwMW14qNv6oeTX3UsC
	 FaGEaur1KyYM77Y/JYmIuw1Y6XrAFoSSxyNDDWkLd9dQ9J3ok3lKhZ11oKur9/K4ZVU/Z
	 E3MhpY09WJfGQ9Ba7iQn7bPZgEjLwohNuw52GzZUcgRnZBPuUsf54buQw6K7KuSOkiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6379606D546
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6379606D546
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so1458975c88.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514904; x=1793119704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=MpsKsNpUPa9OV+dFwz6mIl+c77SGqOYzrbVx2rnpteX5BPlPEJwM44zo+/HlLyridu
         Wh5Y6MzKSI6U8paCI7G2guImYowAT5lsf6NLtyhhUaIjEoBLTobTeGX1YeGkP/5OB43c
         IXvGDmp4lpSuJzRmU7B2sYkh3iDXc9nsRpOj6CsO4uatd6o3Yfx3G95/uwS5L7ptzX09
         pGi+0u0SPEIPdEvH0sWtIsOWH8jTd4zf7w4GaLZE8yV9l44zRSNh9XGnUTutIWKTJm+Z
         AmyPoRtzB5LxAC9tSTuEAV+vazbcKN1k/GGXqvPT3+auHUE816zL2doQBTUbeLN7AcwB
         SIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514904; x=1793119704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=kL3kqrPh3leIq9oEVKmV1+3TD5xitaVDJVfNbBrTxl8gHLyE7nsI6GXJhEY6lzuidW
         Sv+byNoqRDKUughIeoJBsz7NOnbSoJckyU1Niya1EodlxuOkqpuHIzqG8JXGrPUeeLbr
         o8CWpsTgb2XZmR0OMki9QDKQixbSYmiLE69g05KewT/yrd3jwMlfzIGacqH7jZ7j5dZK
         SvFwJrSSrM2+zkI0uZUfeNw+a53CBOtybjjkjZzGh6742NYDMnMYYxRBZCOXfIqy2cHN
         e4pnb7cmYN36Gxn4TiYbvTtkcO1T2fY88RFBOkkU5q0bVvuZK6/+VICIp96dsdY1mlz6
         Hg+A==
X-Forwarded-Encrypted: i=1; AKwUvBwmL03S+7Fqw0YkVeCPpaOAokP3iNgxPSXE1kebnfh/jfh3L4bZd2vAjTzyEEf4m+J1hWUQrQ3o7eo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJXwU5qtDOvIWu9TLDS+l37ErwzPIOdvkhtUFA0S90TluWjlI5
	eXIw2gfM8+FgfVrKA4e/MYAoBVD9oMu3EDZLNLCn5Z2dcEvz5NJ5pTCBhITmYHD3/w4=
X-Gm-Gg: AYBFou3QvnM+Cqt8MLuwGmez26guSF7zUqO/VAGg8DemvWqYz6EgM1s/lZ8pFTrLzy1
	jCAZUvLkvtTHxwzu+kGPES6OWo1qD/rJ5SLe0JF2akBU0SNy3QVWAnQxNHq9P5UM4EE2fvIbDbp
	AwSbT24SJ7VUaibRpFS8h4+1UBN2WE1tjAKCWXFaRSyHXE9GRMeYJzQd5ExDEpb68VqXItdsVnK
	A4SvF+NGZeqsmiJPD92GcqFV7bVKouvJhPMIrU2dqv5l8RhThjqsKnIS/wOaD25U3d92LMNXKqH
	AERCD0LYhKHQ4xK1eiu45j4ek6vpjYdFsI9gcqN1VqdkSMfJj9I9fJOdDtMcvkg72gpVzot4ADY
	+/aFjZXZwYrGwK76GBwpZMnH0P8Jy0Q7ZzwG8zvLE4zwHLCCZI6Kyuo2V+ct4Vi3GwiSwUei+Un
	Rdzh7EqTu7No4thGrLHQmok9ZxXXPJ2D8TNMHJGPlmS3rU8tVbpyuw2I/GUsgK9HQu
X-Received: by 2002:a05:7022:7e88:b0:153:7a27:b7d with SMTP id a92af1059eb24-18512c381a4mr23295394c88.20.1792514904284;
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:20 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:14 +0000
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add TDK
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=YYXyiFzWZmnmcU5S2oOonde7bNLiYUA6N0ss7PIEEY7AN7tqRSbLfGp6g9tqO6P5vmrvGqDew
 z7yU2imn6/8BEoDXMMxHqN9uoxvqj7QFD4cLZ40g0DV4kCszBvsqQKb
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

