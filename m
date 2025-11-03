Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648A316192
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186805; cv=none; b=Bvh8h1BtQ8plixJLnRSpPH+Wf02Hz82l0TC+N38KVm4GnS+/yJFoFlB3MtqklPsm2hwgcGMcBA4WsUYbYIly87v7DQK7VJYV+YqHnDGvRH4Z3sXJv/0QHa8q867MHfTmNAt2zIaEHentEwRBdgVt/N1a675Yu8kwe7ziNeLI63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186805; c=relaxed/simple;
	bh=mNCO7bKF1YLZWJUvv6QucWgagnW9KRRy5Z/VQ4WsXkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMCpctg9DSQwwWUzqB4edsH1w92AjurT5JysMi3tXiAYxUj+pIVISX+F5tZiMDYUjzreXfUr89GFchwmM99Q3O3Tpu3fNj8bc8ls5tv2Yt5sQl/az9QWdzckfXpl2U+kpYEq4PXIn9C4/xeL5y11qnThTiGvvA+jCEGZU0rrCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP7ygsWI; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP7ygsWI"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4eceef055fbso81153011cf.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762186802; x=1762791602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stkcD7bp9eEScodaC0wp9S9uIOMbzo7VYqM5npEhDuo=;
        b=YP7ygsWI4uYnEBFXIWSJReTo1vPTr2AmE3ku8YVokpGmde+rzBe42cA8nU5qjclEwR
         qH4Y1IKSb/KKmuw5YJGeO+rVdUpm8FZR3GWBRXcKwTWSxL00JIFFH6lY3c4aTvxw8fZk
         TKa/MDue6XsPkJc5jLicI3U1QjvVjsfYfYagi2W7hzj8wvbojBbBNkK6C/6s0g8C93x+
         nixx86mERz42qzzxDxV0sbHPEV4KFuS4rOAlT4bF+fgKkBm987UcpSWLolgBTHB0eVYj
         K9R3Fz1C5P/7lXcF6JHXPjHi3VjlqNx3ZAPgIq5VFTWkQ48wXqqpxCNYQf0GoyxmjceF
         1jQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186802; x=1762791602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stkcD7bp9eEScodaC0wp9S9uIOMbzo7VYqM5npEhDuo=;
        b=gpy2DmDtFm9gAbsdfGoeJaqgxvAjVulikUgLG2R5YDa4fzM+1lDJby/FQJbYgObD8R
         HtJbyhhujDw5CCJFiMJYngxQRJtMn6zRXPniy1dVr85QO924o5uUsKV7GxOd6/sSTuiG
         GSiJMvLiae3I0uGXXmqr+tWOk9g/mKAhsr8HNYOf2Zo0V741G7ymOy5n5+mW8uk1IG9G
         5TT/hl6s2mF69SYzfG8UDrndNxu7kkG02l4zWquTHI8ui2pBUCI73jG7soHMxnS6Cd7F
         /t576zD2yy7WL+iQy8jbCXHPGbtaIQuMDkhGv2NYsPxehcu2i6xyDdXETSGoUc7LXVzs
         FlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnX2sOMukPqGd7wvlXmOiCUqjFPqDM0o3GjmxusMsaAOY2o6fZHzu5be3xtLhw7uoqQ/93tNykRjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0V6Pt8PjIKbggNoblvFVvF+1tQxorGloSFxbAUszmB0rEGDk
	0TH6q/xq0GJJuzKhc23Go9NZd6lM0wu8oRVbpdEb6V8tJ9801aEYIB0T
X-Gm-Gg: ASbGncs4Azrj3yd5Yp4dFsP15fMJBtAZzsjtvilT/YdU3OeMGMQUvgEqO40JSzIISzY
	UiZFsSPNDBD/ZDHKvgY1sq5yUeV6ejpDMAklcDGLwos9RULWkFU+Qiq2hp9mLfhrQCpJyHXIY1P
	L9QchVX9JFIgAShEfD5v8zmpYFkSrYtYBap+572f7Pe/M2HxghLBtAGiGjhCyjlmw4nvSesG6xT
	RPwkL87BQzUxM/zThWj53eRfDDw0Ycxuf9MLlASY0Ha6A4kPe6lCP8b0pYhPko3TeXGYNMRZldI
	vz0S2+EZZiG1FCdPPOcXNaTf8f4pNEtOqN33WH57tlKi/1dAkN0X/bB9RIQ+uSDc9dZmEhkGj/N
	40HeaRhI11jiCupw1ASHsBrGvt5i4s/qKwKHFkYxIhr79/UneITHT+fZM0gOXlZ3yjOuXq8yrkf
	irEFbvjZAJP0W1M8o=
X-Google-Smtp-Source: AGHT+IGe1q09n9Y3T70y+bZseDCq548mz/zlbtRlwZW06qsqGJ+EAcKCvfGCZuP/HMHl9AMMVlN6zw==
X-Received: by 2002:a05:622a:989:b0:4eb:a33d:1f45 with SMTP id d75a77b69052e-4ed30dcd062mr185924351cf.33.1762186801557;
        Mon, 03 Nov 2025 08:20:01 -0800 (PST)
Received: from ideapad.tufts.edu ([130.64.64.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060eb3332sm4273556d6.60.2025.11.03.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 08:20:01 -0800 (PST)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: rostedt@goodmis.org,
	tglozar@redhat.com,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>
Subject: [PATCH v5 2/2] rtla: fix -a overriding -t argument
Date: Mon,  3 Nov 2025 11:19:08 -0500
Message-ID: <b6ae60424050b2c1c8709e18759adead6012b971.1762186418.git.ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1762186418.git.ipravdin.official@gmail.com>
References: <cover.1762186418.git.ipravdin.official@gmail.com>
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
 tools/tracing/rtla/src/osnoise_top.c   | 3 ++-
 tools/tracing/rtla/src/timerlat_hist.c | 3 ++-
 tools/tracing/rtla/src/timerlat_top.c  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

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
index 0be400666c05..6ae7cdb3bdc0 100644
--- a/tools/tracing/rtla/src/osnoise_top.c
+++ b/tools/tracing/rtla/src/osnoise_top.c
@@ -397,7 +397,8 @@ struct common_params *osnoise_top_parse_args(int argc, char **argv)
 			params->threshold = 1;
 
 			/* set trace */
-			trace_output = "osnoise_trace.txt";
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

