Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C80175A85
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961115; cv=none; b=Z2gTpJQppleMQOMsdRlFE7ePvUunsBpsrrieZ0G1ICD9T54u2xyVto1cJrsbxj8eAAaexCxRRD0ucZnVMN+080PgNMc2MkkVWwJ20zJzjYGFL6o35AL+c4PaWFEa2dl499nMpC/Ts2IumFSwTEMnEmk6WPvPmFKBqjAzF87lGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961115; c=relaxed/simple;
	bh=MGAVWVaW+Tg8dZUdOiFPSJ3nrgTHVCtI9XtxGfm6MrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzdgYNQnj6UKSCSNYAeEO8a6OpAIMzXCtCbeCH0HXSa8M6arvJwbtlvLFGXIuFd3gpargnRPWjwX83rLSOJs84zHR9Pz9WV+8U1pLke3W27WDKAz0VnPomP3mRkr0716rlSTrpc8cjsxyf3hoeeQTS26CIq5/uwQyzfUEqKbl/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQW20HX2; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQW20HX2"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5d082395235so1141182e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961105; x=1791565905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+7nU1vQBqIL4fZLlZLYX7HC1ZmF5kpJ2h6hcqSk68MA=;
        b=LQW20HX2Akq03XZTQWBVQBF3mRTnNqfhutSOMicYC+NZzav9kxjneOPUDxZTjAxDpg
         Vxm7Ms6xxNxJ+yhrVtiPHK4s7DoZBksgNuA8OdhXk5KiSQvP2no98x4Be+Gnn5WBoQg+
         JO4jIIZa+g1kxnB9b1aM8BEI0e5okZBIUV1+cX0WNZ3Fx2WgLr2DVyOpUa1wlhOP5qBJ
         mZTDCIcmfVs3HCQJ1yH7wCC3G9JC4SHTuErN8ZUJXJKFxsMkIdYBVaCl8i+ZRp/Rwapx
         KyHBR0aqhJzCOQleMWDDmSReXkfu4CkYLon7JNICsAJ2WBEOIUTftgR8+Z68AeQdHMM+
         SVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961105; x=1791565905;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7nU1vQBqIL4fZLlZLYX7HC1ZmF5kpJ2h6hcqSk68MA=;
        b=GLmYsz2ibV0Tg7WuYZknNsGvau/933ik84fVmjoIrd/QF6rnt/rA2AN3W0/1jzD1mz
         LgsVOSU9SyzxTtMGTJ5NVyTZB6gaP56CAQpBcJaCMH3ZdZC27dvkKR9UN70PrhGCfiHG
         Ld31wbXAviGP/4aImRa0dQoX/Xd0Z/MPRHvxn2CylcBtS1BeLc6DHMnR/2skirCJTuTU
         ahMUHx+iAoVGKAKkrEvEBhv3wpEJkoAdGQWiWUnF9n1G6C24aqMT2Hh7nq34lHgTty9R
         6WTj3NKNd97aAbB1J9BdAZbaIHkDVpRR5CJM3MmSX1H52Xu1hlc1A/h3LtZ/w+S2zs+O
         UErQ==
X-Gm-Message-State: AFq9FYIqo+PUZmkD2QRSfYUZjvtj9jiE/hA/3w4O+f3l/Gr9HEqIdzYc
	xHSfZDOA8q7/n5DV1r9xN7HlvgGF6Wy3XFb1jgeItr51D6/sbHVMS/YSE989D8Jr
X-Gm-Gg: AYBFou0PQXIDx4ALiPXHj2MD5TwG4cRTg+iLHLdVXps/VbRr1rqoKMkpqvyfZ/hx89h
	KxEFV9pAU7zTEye6PEFea6dropYJ8u3oBJmJy8QpXuCmUSafNogF1lauki7JMRcLSzqbVnQszai
	bZQZLYxnhfgBDLkG756hC2oa2sPGTbkb201a1420oM9krMzUMYrDEaLO3+4NEgnyRkDSbiS2qAE
	GIMMkMPmdf9ufTP7GPP9pqb5xsakyvgJEacjTtmeSc7DrYSTfvtiBiLk9tVkBozJcx2B5y6eARR
	uwyJizVORjENdToI4exRNIZgwfXXC+VH5hrY8dbZrIgkebmeWZFqOtT9t7ff2ji8ckGwkEfe+eQ
	qrut3ni0Q9f429nFEx0pIdgKoA/29VbL3rP2+Y3uU8CMR2D1Nq9Z/837Y1eQcDyEVhUk/q1cyku
	LbViFzYwAj6mPi/M17hwBOmzxKv87QHB5LXl8IFL/HAd2FgTjZvxTbmyM3ubKp9ixzRVgaErCYZ
	yw49GcH7xihggRlzuvcLKhpQSHr8begJMbdMufCCNNvam17LLd/kaE0u19USuyMx13tBe+ToDyC
	P0Gsy4GIcKw+wALDVPpSyMit
X-Received: by 2002:a05:6122:680b:20b0:5c9:a5b6:27b5 with SMTP id 71dfb90a1353d-5d7b5f7d79emr1567842e0c.18.1790961105385;
        Fri, 02 Oct 2026 10:11:45 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 01/10] docs/translations/pt_BR: admin-guide: add features.rst
Date: Fri,  2 Oct 2026 14:11:24 -0300
Message-ID: <20261002171133.50969-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add features.rst and update admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/admin-guide/features.rst | 3 +++
 Documentation/translations/pt_BR/admin-guide/index.rst    | 5 +----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/features.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/features.rst b/Documentation/translations/pt_BR/admin-guide/features.rst
new file mode 100644
index 000000000..7651eca38
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: features
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 471b76f00..2db14d3b4 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -26,10 +26,7 @@ etc.
 
    README
    devices
-
-Todolist:
-
-*   features
+   features
 
 Uma grande parte da interface administrativa do kernel são os sistemas de
 arquivos virtuais /proc e sysfs; estes documentos descrevem como interagir
-- 
2.47.3

