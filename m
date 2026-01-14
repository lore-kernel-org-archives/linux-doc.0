Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E82FC876
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355953; cv=none; b=h4UjM1dRVZZcnltjkktU/UdM85Irv0/c9UShLjeQiEhhAFd2skexlvcGObiRXWHWugvLSE7NKwG4tVe2jTaxTq2DWDfACOT9WlY/yLVU1qpoN4FFwtCRQbGz5bstDeAqjanJbyBG1XcHPA0xz49ij29jwYTOa9gpSDyXPasSHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355953; c=relaxed/simple;
	bh=buhxBjHOVKorNueLk5sK7AoBcrC3h4riWAq7157uSMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8Q/2Ctd0dOgNragxK04c3ZKQ25v4MsTQ0lr5h9teTXFXvYTq2I6hevvANGXZQGL26q1DMLJiKPkv/2s3UgLMWd7FGVV2T0kuwLQNa7l8WdfPkqzOko61C7UebGw7n6fkCPQNzD7wmJcJqhMidxAVaaizZCm9e9WlAmsJtZ0eH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsuiyZv7; arc=none smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsuiyZv7"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-3ed15120e55so5668379fac.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355948; x=1768960748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
        b=DsuiyZv7CIU6U0L0cMoBchRXu+lxSRFwAoh44p05wOrGL9px8JWy5W1zp4uq3E/7yZ
         JY5VfmxD9NisOujwfk9QBTvhsxGJXNv9nzvunEUnxVOJxi3nCE5Pl15OTlmORmbv88ti
         ou3ehLm/uqzFtE1d/2pSpi/vB6zFqLijZ8otrfZkVXtpELxMHAd+46A6It7rYUUHFVdF
         VSPKV/sEwkADRSPXpeZGtaMkhgG+7w42gmbgCoGmV8VdbtNpOs0Z31+zGFePDnyaw+Ww
         QMyN4bzjnw7FvQSgRyN5QxVWEN5qR6fOONzV1sm1/DrC+I1fPJTfEVyG5T9+4DWl+gw4
         o7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355948; x=1768960748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
        b=xEz1wx1k+1c/afeUtCb0SsgPZywGRPIqUrjTHC1vgTYNEBO/3ct9Plj29e11Dens7i
         xVLZBDg1C/VTG70wqajRWuM/X9zZ7ilCZ/Tm7eTOAIrXPRSU49TwVoV+oY0w1W9TZEHC
         zVraSv0dz3jqgUjtdsQ1kJ5KGDoswaCFTT2JnvjgT4CTdtP36IxDNntVVBOh3GP78wkZ
         o5L2IO6VUNA2CmDtljIK/sBNbUQRhxe4zhNW1NA5MaRMn3f6VLMfIMUZV6LtBmWPWDEB
         Mg/8/4r6dbw4KRVWHkwQTYgpb8erpVBUczCC4zW/oQcjTHSTisgbbb33ZAnZLeCdiF66
         Eb4A==
X-Forwarded-Encrypted: i=1; AJvYcCXf0xSnWIkSYzhWbCiifhbZylOPbY9qy5qlvrGdLAiMGRTdIxY1LgXp5MgbvPVvvUr+JuUZByAntIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtk9QiLMEvREkvKg/d5ZOl9qzWChMQEqf5oYe7y0gdd+Ov4Xgv
	cFjkY90tlB+FleEOboMAgV+a9B45fzHrucgJPr9S9roBv2GWYasVsMKH
X-Gm-Gg: AY/fxX7XjiaPjc3Oeh0bwE5PUsIOxSoebJamU6owZ4bkHm/EjHxqwaU5RiXkEoD8itr
	M+rkluJU/O9yyGcpHMNwwrXZxFEQ+7NMvbOs6wJzm6aJlPC1XkpJ3pg65zG7jpsXA9a7UkaPsAW
	uuFp+GR9NThN+BKImsQ4avXBFbAZmRXEQeUoj769e/JUWDLetkGZVco4hPljFWydXnol/n10eEI
	ipjNOuIQuDshzcVN2FHGVriB4bwXvBfdTxTKMzYIN9jPbjSHBHxwnGvuBdAYa4GdbmFvAS8b7bA
	QknAhPtyAunYXHWkL40e0T3mYGySWVBIfW/QietUnDFLe/TAipvV9t+ovAqlaKhzrnwNyjBnkH5
	aXqLwz0aQWmXTjlelXsXmRu2l6IfbUYwpr0xMOTP8FK0U7B4851Z9XmZUtgyNa5zGNpiYYlrwvg
	S/tqxxNtNtWhChyhe+Gt0WdUQy1svOk+RlpFA8
X-Received: by 2002:a05:6871:3a0f:b0:3ec:44ca:ca33 with SMTP id 586e51a60fabf-40406f3b654mr743821fac.4.1768355947689;
        Tue, 13 Jan 2026 17:59:07 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4040cba2d2asm341362fac.5.2026.01.13.17.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:07 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 06/31] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Tue, 13 Jan 2026 18:57:22 -0700
Message-ID: <20260114015815.1565725-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index eb5146bcfaca..cb171088850c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1165,7 +1165,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.52.0

