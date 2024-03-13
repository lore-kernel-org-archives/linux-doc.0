Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751F1118C
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293126; cv=none; b=f/tJLfkNO29fchtQhdxOEpM0V4woWYK5VNI8HGPfzAs8Hmg07BH1WrOLBpjdzKbJcBbm/L0NIxII8BDit38qoTp4fmJ/2C2J07DjUWSAawwm5ptDq2QZDNLbwp0tjJN2kAnvK0Vi3TSpqO48DF0Dv9oTxVu5eqltt0Jl+kXqQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293126; c=relaxed/simple;
	bh=cu3MMzOHuWJKImjKqYJ4/NXYAdw+8BhcKEGy95D0Imk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kcBOFGI2QOEsPwx0Nxc22JyxEnCGiVWB8mpoeVoqlUL9x6woQl4JlapgrhGt/kQAZH96jxPLCaa6M2WyYCEIoCho8nq1GWG1K4euPPdYnP8oMt53wsVjYrwp1Nc1Lm7MJOOZwpQXMwZe0jlHPSIOcwJcgoAp2pB8qQjfkYDvVzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=Rqssngnl; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="Rqssngnl"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68f41af71ebso4405296d6.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 18:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1710293123; x=1710897923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jDrn7wgy/ve0lPoR/xKtbF/cZLSIaETTt3wbkL2858=;
        b=RqssngnlyfPfkO1M7NSQ7hg3w1o+3ugwNj8VifSkFo1gE1VncEZG/qRGwEVRuwk5dR
         /Q+q98uVy6tOx2QCuE1fpom5WUFBjIhgylb2lQOzjzRdLS6sJVxiBy5mUS4YPmZZPn/4
         i8CkPjqp+1KWYqvNEOhxS2kbqfgX4IsZwjc7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710293123; x=1710897923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jDrn7wgy/ve0lPoR/xKtbF/cZLSIaETTt3wbkL2858=;
        b=vCTc2uWjvgd+a0e6becYoI4U933gxllQ3TQrtt+t02WzuFDjIS6fkUYzmuP3kAWyFF
         St8mNqmLKze6EnsRJ3Depus3VXwJaSdWJK31jLLeN2mDtpa1W9xfDJAq1bu5GdsU2uva
         o094RePVyrPmFcu3nkmp/vf1fMa3EG8kV9lR7XGitE9p2CYZVH+0maztz0hyoDdsh20q
         O+Xw2WFz6PRwHnwZfoZzxUKm4Qw/Jia57Nk8Nzpcnn2iqXe7jmEXKxHhyHx2g+C9b6M0
         o3Y4mOJVckbd5StmVbY/HtKWjW4n3p0HUvd+QUJh0ldxnfF/3BzSHR5mZ/5n6PYU+8kO
         ewGw==
X-Forwarded-Encrypted: i=1; AJvYcCXFuGU6r1PRpNapDqnLNtQc+PwUepugeyCQxZ6rsSTOehjtKdc4pCoKZ+iqe+R3bGYi0wj3hELN5z3e6cN9ZieexGUho74vtJ73
X-Gm-Message-State: AOJu0YxLlAhidHwe+ylaHneNTGwl3aMEIXxJy+pVFcIHR4PlaluHzci9
	8nGJoi08qRQXCrkf31ipP12EZRFaIY06AxyO/gokw2tu/4QpLxIYsndQhHFMjTU=
X-Google-Smtp-Source: AGHT+IEbJtuWeR15hakVbXEMMZTuDPev36PD/22XP5I3KXlRLbjFh9A2AyTmrw6JNT7mBOc3CUEd2A==
X-Received: by 2002:a05:6214:238a:b0:691:907:f9e5 with SMTP id fw10-20020a056214238a00b006910907f9e5mr1929870qvb.12.1710293123162;
        Tue, 12 Mar 2024 18:25:23 -0700 (PDT)
Received: from joelbox2.. (c-98-249-43-138.hsd1.va.comcast.net. [98.249.43.138])
        by smtp.gmail.com with ESMTPSA id u9-20020a05621411a900b00690314356a4sm4162132qvv.80.2024.03.12.18.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 18:25:21 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Suleiman Souhlal <suleiman@google.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	David Vernet <void@manifault.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	joseph.salisbury@canonical.com,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Phil Auld <pauld@redhat.com>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 09/15] admin-guide/hw-vuln: Correct prctl() argument description
Date: Tue, 12 Mar 2024 21:24:45 -0400
Message-Id: <20240313012451.1693807-10-joel@joelfernandes.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313012451.1693807-1-joel@joelfernandes.org>
References: <20240313012451.1693807-1-joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the description for arg4 which appears to be outdated.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/admin-guide/hw-vuln/core-scheduling.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/core-scheduling.rst b/Documentation/admin-guide/hw-vuln/core-scheduling.rst
index cf1eeefdfc32..338d639a8127 100644
--- a/Documentation/admin-guide/hw-vuln/core-scheduling.rst
+++ b/Documentation/admin-guide/hw-vuln/core-scheduling.rst
@@ -62,8 +62,8 @@ arg3:
 
 arg4:
     ``pid_type`` for which the operation applies. It is one of
-    ``PR_SCHED_CORE_SCOPE_``-prefixed macro constants.  For example, if arg4
-    is ``PR_SCHED_CORE_SCOPE_THREAD_GROUP``, then the operation of this command
+    ``PIDTIME_``-prefixed macro constants.  For example, if arg4
+    is ``PIDTYPE_TGID``, then the operation of this command
     will be performed for all tasks in the task group of ``pid``.
 
 arg5:
-- 
2.34.1

