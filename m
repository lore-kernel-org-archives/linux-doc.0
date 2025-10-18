Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8392D7DD8
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760792694; cv=none; b=BHMrN7jD4UC7CdgZfAH+l44DH74PRN81aHEpFEVYabhlJg0Tf5jhZpi6pAI7LhESXn+0PPPdvNLWzMy7nQTA58U0058XfeEfCPRRAIUyN9/NswKSlMOtAO3sDagxM9/56cYlWBgV3RY3ZFB8Rb2QW6pwS1jpQyn5jRdrxetCdSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760792694; c=relaxed/simple;
	bh=/QKA0xRQrUJstKtOglqkTvta05yDY6MtV3GQJq3894Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxlalK0KLRjun2kIstcjgc8L/jI2U9ztfjvovAutR1hlOuZLkdYxNQVEtZmXCTOUzxNDSsV9J+efOFTdMXNUL62kOlUJNe6BaoQVQyt+ddFSXeK/PqMJUewfl/4hDL3ss4UZ7/5FUOdLExlNLD1PGmMQk/iMTZxIFtDNoYoQj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKBe9OAt; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKBe9OAt"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-87c1a760df5so55537986d6.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760792691; x=1761397491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWnt+sjZ8ZgsaI+sAzX/D1lkWlG+AQb06P47+lpZEQg=;
        b=PKBe9OAtNm2mYV7LBc/I1P+3WdYFxg32SnRmqXzmR0AC6IhklsxEs7827chNf1tcmu
         7buyvT30Mb4C8cHXMTwRPT16ZhLUZNXwtZeABLYMWojXrECnFVtdLiP52bzk9a8s5RV4
         Gxer1r4m/OGFS1yLYmoL2Tq6q9hP90PyMCweaJQXPSkFGqrxRexa/SPlv07IhaY9Ym1j
         u0ZHl73Jw5vJfsdwDmyycLtyN3Lhg8HQaecqgEokKffpWKdjgSAc8xh2mWyYp38hsnk7
         QJlok8rWmf93BTqSlYQ0A6j7S7bl21MoWrWSkW5rOMQtRNHhGK08pRtA4A7qdiS+uiJj
         p+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760792691; x=1761397491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWnt+sjZ8ZgsaI+sAzX/D1lkWlG+AQb06P47+lpZEQg=;
        b=VwEzQMRgGagTZCzFulGeTX3pQeAVPTI6P37ep/srBphvtLIb50TLeGLy/KJCvC8Ptt
         jz6mKcnCen2L7ggEoUqxTq66JufQEukRvfHksHxHg9CkCB8T0rIMx7/kFff903UunBjX
         RD3zRHTi15EfOkyVzj4Y8Hy3oAwdkS9kYbXIa7j9Gaa3fuTCoK94PJ24xeEP0f/y1idx
         1+o8OonCL6OlZSwsNLYFvbDE5GJyxozQfvwYTnwMhTDy6Pz55gSQSVXdFLlSY31dtPGS
         b6ZS2d+kInlqPzBJBJM8gdIUsY4HoFaggoussMlb/+kaoxzPBYc3DBI9CZlTFz530DNe
         +hfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0grpHw8iFPzKUsQEzLKg2KmGIZQ/sduQc6VImXlP6l/P4nk3ZEkxoVIMQWYJXspYZvZVmiLlhrOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvD68LleNaN6yQgjO1CVHoD2YLA9B43wHrIx2WYzlE2cm3vTw
	JCGvbKYlpGeaKM1nYUOqVRkksoBKCS2K+1i9TZcr/ENtqgE+8u+yEziT
X-Gm-Gg: ASbGncsWoWCNR+OFnb/LnqFNMzlA0TMWH6Q40GpfyyLyzzHzMEFQZ8qSR+uJJ8dOT7G
	GxVFBvjyzTbUacVcy3X4XkFRZRu4OdxrJzXMQxCf7lolHaepVS6IND8dS02EiOVUFfR93GDMk27
	QSr7E3KiwGuut5+LuSXYjlYOMMgrg0Ee4j0B8LGau3SbtHRIAVQzwt1U5/UDsouxO1CAK6pC/qb
	Pt4Gkgo3ktk1P/F8auKDnOCS4lSLXGQgICxLasrH3+Hyh2QMYxgtRxUlH5bpvQe9HV6U71n3tVR
	/N6Ok39dOthnJM0DDinu/+/pai5Hxf21et3V7xIAvsk0h+MCweR+1XGIHoQaFlZTwo+5jLQ2d2H
	9Lv3DW1COOJk+zHchXNVaYMZ2oXaqpjXo+pM+WAqaJ3KPQsaU3ZfdOULdvr3quUqG1ZccqYXaOv
	GULdemEGCKBLiKq9SLd+gEh7jdPJD6l7eLSxH+
X-Google-Smtp-Source: AGHT+IHmRouhpzmNuhXsb90wciLNRo+Xh2dXpLMyR7s2zHZrsvFLahcyOci9MsF3wzHDrdrwup9N5g==
X-Received: by 2002:a05:6214:1948:b0:87c:dff0:7c0a with SMTP id 6a1803df08f44-87cdff07d94mr54571536d6.55.1760792691024;
        Sat, 18 Oct 2025 06:04:51 -0700 (PDT)
Received: from ideapad.mynetworksettings.com ([2600:4040:5304:d300:275f:6229:da5:6a60])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028966fasm15840596d6.33.2025.10.18.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 06:04:50 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: rostedt@goodmis.org,
	tglozar@redhat.com,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>
Subject: [PATCH v4 2/2] rtla: fix -a overriding -t argument
Date: Sat, 18 Oct 2025 09:04:31 -0400
Message-ID: <93cf8411e8c23ebdcf2e168f0f7d3e8c9081900b.1760791697.git.ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1760791697.git.ipravdin.official@gmail.com>
References: <cover.1760791697.git.ipravdin.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running rtla as

    `rtla <timerlat|osnoise> <top|hist> -t custom_file.txt -a 100`

-a options override trace output filename specified by -t option.
Running the command above will create <timerlat|osnoise>_trace.txt file
instead of custom_file.txt. Fix this by making sure that -a option does
not override trace output filename even if it's passed after trace
output filename is specified.

Fixes: 173a3b014827 ("rtla/timerlat: Add the automatic trace option")
Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
Reviewed-by: Tomas Glozar <tglozar@redhat.com>
---
 tools/tracing/rtla/src/osnoise_hist.c  | 3 ++-
 tools/tracing/rtla/src/osnoise_top.c   | 2 ++
 tools/tracing/rtla/src/timerlat_hist.c | 3 ++-
 tools/tracing/rtla/src/timerlat_top.c  | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/tracing/rtla/src/osnoise_hist.c b/tools/tracing/rtla/src/osnoise_hist.c
index 8b12d8803998..ae8426f40f8f 100644
--- a/tools/tracing/rtla/src/osnoise_hist.c
+++ b/tools/tracing/rtla/src/osnoise_hist.c
@@ -557,7 +557,8 @@ static struct common_params
 			params->threshold = 1;
 
 			/* set trace */
-			trace_output = "osnoise_trace.txt";
+			if (!trace_output)
+				trace_output = "osnoise_trace.txt";
 
 			break;
 		case 'b':
diff --git a/tools/tracing/rtla/src/osnoise_top.c b/tools/tracing/rtla/src/osnoise_top.c
index 0be400666c05..9487c6a592c2 100644
--- a/tools/tracing/rtla/src/osnoise_top.c
+++ b/tools/tracing/rtla/src/osnoise_top.c
@@ -398,6 +398,8 @@ struct common_params *osnoise_top_parse_args(int argc, char **argv)
 
 			/* set trace */
 			trace_output = "osnoise_trace.txt";
+			if (!trace_output)
+				trace_output = "osnoise_trace.txt";
 
 			break;
 		case 'c':
diff --git a/tools/tracing/rtla/src/timerlat_hist.c b/tools/tracing/rtla/src/timerlat_hist.c
index 16416192e432..311c4f18ce4c 100644
--- a/tools/tracing/rtla/src/timerlat_hist.c
+++ b/tools/tracing/rtla/src/timerlat_hist.c
@@ -878,7 +878,8 @@ static struct common_params
 			params->print_stack = auto_thresh;
 
 			/* set trace */
-			trace_output = "timerlat_trace.txt";
+			if (!trace_output)
+				trace_output = "timerlat_trace.txt";
 
 			break;
 		case 'c':
diff --git a/tools/tracing/rtla/src/timerlat_top.c b/tools/tracing/rtla/src/timerlat_top.c
index fe4f4e69e00f..3a3b11b5beaa 100644
--- a/tools/tracing/rtla/src/timerlat_top.c
+++ b/tools/tracing/rtla/src/timerlat_top.c
@@ -628,7 +628,8 @@ static struct common_params
 			params->print_stack = auto_thresh;
 
 			/* set trace */
-			trace_output = "timerlat_trace.txt";
+			if (!trace_output)
+				trace_output = "timerlat_trace.txt";
 
 			break;
 		case '5':
-- 
2.48.1

