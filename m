Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857527;
	b=AkY4T2RrKFuln+brmeC8jpgRrDksAGwofzxO5DiFRyEI8asbAKf4HRQAmkp7tLvLEOH5
	 QAxn3Bg/7IuhQbkfMSDd1TOjehxPl80Hd9VS041Wr++4OExjJiUGiEbC3SLOoI0dUl7Au
	 26B86F6MUyiLj7cM8SOm7fICYtNj0d2i8Uzlx4c5HEbakKdnTLUofAaKBfpHkf0N7DaL3
	 HfOxZVLs8V7CXxdtddGwVo7AfCokYXnXmmifUaPWiLIBXjikpCOImltcRD+8WzQ/wYL2W
	 Ma6bO8f4EadUIUAiYdfPmObjSY2C4vUK5OXeLlJ1GPwL79PyUjKLOHpM3LFqN/gP/9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QHBi/kFqk++CZ+SPDTCxQq76agXRbZkghzbM3h1MwDA=;
	b=D9ZeLp+EtwrvxbqiwmUwVf7z9Os5VsejNyoqXz8FaTbKZA6PzZcLLKH22IR+9UPQeVuq
	 MM4QokYZH4iaX4xCMzLtRdyNpaLsM+EU8aAZMoMMwyQUbKNGlfODEbhRmBJ44tzjKyUYo
	 cj7N7V28ireNowpYmZeq/EK0NZ/3PpdPPJ+5Y8V7V8CB+Dv9Bv61h3arV9MGRIWKlDcx7
	 NLwSFrE4iuKKIMXMTGw7WoN8AVOANbHhEp1f+PGlSzyOQ/CMNR275OJqKBduZpVDj4E5b
	 +MvShxBxBFPQmppfno5okbz0trrZcayE/+ZYNNgbhGLNOS47waHHVHvaC+v++lnlkaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfwPj9vc;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180C606A31F
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 09:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6180C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfwPj9vc
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cd697a57d7eso2452560a12.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 01:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795857527; x=1796462327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHBi/kFqk++CZ+SPDTCxQq76agXRbZkghzbM3h1MwDA=;
        b=qfwPj9vchvVNjqffu/2Q4ek0v80MK+yha822ZDECq49xZAo/Mj3Pkdyvd/G1VZe/Rt
         deyxNHXI+CZgOSgF1zYGzDXFeWxavtJdQK6/WvQmLO09dBAi5aO9EYCRjSogtOXQQY/0
         TqRKHxY7dHFtfZajCp4aU0ACdhY+Q+S9MzPfVEjs6sSum3Ioi3VLhni2jKw83+mpHQiT
         /TQEMPl+aC11LSOpIrY1ASCU8ULCyS4UX1d11HG6e016N7VoTFed16Lw9+ERNZ4pQZku
         jiUNg/J8FJDSRjgK4aHBXmMmupUvb9LG+L/W+twqCFzDf+vLDTkfEi2ikL81TwManYnr
         XCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857527; x=1796462327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHBi/kFqk++CZ+SPDTCxQq76agXRbZkghzbM3h1MwDA=;
        b=1HkE5e0FzbzNUUe7pK21Al2oXia5A8Lt0Ziksk5iegyOjXRSRVhh943+qZIKCpNDOs
         MVWlmLyYn4LlPRjzLwbdCODjqSAWStYOocqZmv8Ey4L9pJYnTOC+SLRNwA60qR7uTGua
         aFXqH8ijT+N7fa2xVDbjAUAmX5LddSsfKV2yNtMoyQkrWKLr/VzLOREsHmTmt9v3aHTH
         gpc2EcyV8Ng01HEw/hDGRTwM2N6WZlW1bGV4XYdFLapS4iywB8WzbB+bUwISBmtzAreX
         tGe5ODgJkzdHqJCxxsxCk0d8DowZ7j/lzeJPDpHEcb+LrptbRFepuFWvKSqH0Mt3NWzG
         EDGw==
X-Forwarded-Encrypted: i=1; AL+hErGnftXNprbHyBlwGOR5qDI4tpQwMcCnlILZX6EjzUNs3i1BWs/hbA+jErDR2LbDQ2c41VU/0h77UE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NqAvoYvWPM4Q8nennoBT3Jt8sJq171BQODVtnNzAFlLgjfIZF
	cOwbSkS8y/PWh+6KACGvlWKX3ktD0/DUUkOTUPtUucrI6c7+yuU5Fxz4
X-Gm-Gg: AZFdTZdlmITgP6VWrH5Cn136udf1uzD46e6qv24jUTRmToo0MSbQ09AHRCWpbUpZ0y7
	o+jsc0wEFkHgF+gSmPGw9AgnOp4+8ou4UWEZn65tOf45tOIx/OvoBB8W6kpDx4/yUpb2Q3rhpv/
	Lbprf4StroejFg8qVaU1w2ozg7rqNcsh4/hVeTNIcNago6P3ldCHU+bGfAWSgJYGlc+2v7IqSFy
	QSyY8nfqWDqRJJ4xMjD655BJhwiHlrkFFuAzCVj56xmxi9G3Sfd9dbzDz3XsuqQrm90LtYguLi/
	Gp8uz7k6u9AIFacwllYZR/XztYaPwc8BHPUy+rYN3H5gQbYbDiUzOmU80IVW1xgraqLc8s/bvYC
	WVHsFjKW9FzRPoJmbkrj/TCrxdi/hlhFKTAk1oXFQl9ho7zCIFcP3w1sLD5VEc/AicJVZduERnk
	sRcApdxmaXJ4dBPg9vVCKgjnCmgT0FoxxHnVae9mpQGRvKNK5JEcfsqp2WNliRrPAuDAPsiuJf3
	jQyt/+ny6bJwD7Yg/cU6A0vXUJnk2imb49PTvduIMdWqkDB33Vpjz5bUtBPQUgpHOUff0owCDNN
	SyXF2z5Tcf4QfaF5M1qXvEkyazI=
X-Received: by 2002:a05:6a00:2e9d:b0:880:849d:c07c with SMTP id d2e1a72fcca58-8c87c29172cmr24528688b3a.25.1795857526632;
        Sat, 28 Nov 2026 01:18:46 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:c549:2fb1:e189:bced])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm14070618b3a.56.2026.11.28.01.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:18:46 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: dzm91@hust.edu.cn
Cc: chao.liu@processmission.com,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	zenghui.yu@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add core-api/irq managed_irq Chinese translation
Date: Sat, 28 Nov 2026 09:18:29 +0000
Message-ID: <20261128091829.983996-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <948a8c4c-8899-4393-ab14-eb6eaebb4177@hust.edu.cn>
References: <20261120160539.103773-1-w1355457260@gmail.com> <948a8c4c-8899-4393-ab14-eb6eaebb4177@hust.edu.cn>
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

Hi Dongliang,

Thanks for the review and the Reviewed-by.  I have sent v3 with the
unused cn_managed_irq.rst label removed as you suggested.  Since that
is the only change, I kept your Reviewed-by; please let me know if you
would prefer it dropped.

Thanks,
Zixin
