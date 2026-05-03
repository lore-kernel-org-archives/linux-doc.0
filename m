Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C453137750
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803365; cv=none; b=GPBfi34Slyd1cXWn0mWotMHOyVpoVB6B0b+DI6D1e5uFeGdquDOnH1i3v5n9gISCq6bQ8d8ZRmVW6BNGNt4fxbIu0H9LmW7GlohWj9n9GBn+/R5TdZSo7+E1HGEG7vYZZV+vbd8IgZhB/MSC0UpYz5AI95cLD42pjffilPhyork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803365; c=relaxed/simple;
	bh=uvqHElgEGVKSXwRjONRcK3jel/mrbxQ2SoM4dYFCfLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZBCgCa2SEwZ1O/mP722XqFQQHepeJi2e0pbIddBpMVFAwYMEpgICokt77N4ngT75Qa1aIrWDE7+gSN8lmGzpJaSwhB41vBAyQ65YH5OuYml/z+bV9TKj1RaoN3Q2fzwZcOOcPOrE9A4tLkUqRO7NRZ8vLyC/UJ/BKfX7f21LX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n74JjliD; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n74JjliD"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36534668247so232973a91.1
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777803363; x=1778408163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhd8YbgFXopiqXteo8z5StANTU+DMgBMtEUjnYYd7kA=;
        b=n74JjliDE9yxmuYceC7oVTenrlC0IR57NDnLH2tdZz1lXObn4jZTFYSZuph3q+L4Kc
         bv/uD27NXkC6OGJ3MMmknq6VV+2iqn36QM6caO8pk1KDXVn96A09LNEc4eIC1Z9Py+Hd
         jMTUil9TjbPg9FdcVU4G8ZhoGIwPhdpKviKB7gA5lLRzpJ5Y0Bp0fGC1O+brLytXnvTy
         TSQcvYEz6dyR9EZqVYhI/dpa9JvgU2MQqlHCSQlZ9x4cUF6GCZZtRw5MbR+52ZMeaTuS
         ZyWnfCyjzVCfsRquKINmn1BFuuH3u+U2zh0iXZNnLQ4zEfSUekQ2hPaGCZxq3pSD330w
         n2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777803363; x=1778408163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhd8YbgFXopiqXteo8z5StANTU+DMgBMtEUjnYYd7kA=;
        b=GaOynuU5lGWStjik3pvX4lE1DEe7OhNeNqqHKQo9gMgCBW0DspRx4k0W12VDtw7YfN
         5undYtd6yk1rKgqWjZfztu2Cd1gHDwpYXLZThOt1g8zfhGegUUL8U1jHQtkQ5qi/0zO0
         EWPsvZ4qZrIZwkxFjXkvVdS2x/gPflI0kpk1ZDyqVrNSqAZcN8bIC9VOZkS+Bid58Ohw
         bqOa8CAlvaNtHDQ2yYjxZrj2OnjgIwysIEaFJ+CTBv7tSgULyLPn1Sk3M1wMCzeoV/7w
         UjDXWdjNpJImej8xgdwvuPwZ1cIcMdADblNiv819AH4YlM5mEgjTxnPj9G2rtOzQ7tPK
         zL/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8RfyZfjmyX8LDB2PmGhoHDEHRd8jKx6E1RXgKvqLxwZo63G+K1m/TBnYXtNY6F54SOTP03Z2bUnew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1xTXMhp5wal8ajILCcyIYCYNOd74z53+ndzBNd4etqcyu7cP
	9Uk6NHRhIjWQ7BkF78S3SrZN4jtehZK4zrcnkWjK6zdOFppChKBYzRsp
X-Gm-Gg: AeBDiesybRfU8xWkA7nHByU2vhHK1ZNw9YJl7u0Q5zCPp7ZAx2YdNMHb6IrtmI4bhD8
	8fw+SxIO3iFkRpcRZ4KOhW20LgsI5X/NzpgF1FRZ5N0DYxuIPRD6XS+SQ59AJYmalg4mOkMyQkT
	8GUxS1U1tvtwWSSlwYMuF/g0Y/aAG89Sy2Z29ZYz4xbIs9U4tRPYaUQeAYpYY4ZQKlQL4k2kK76
	sgHenapTR/5yBq6XZrSqfbxXhNzz85OXbBVlQs6mL6V3fBTaWnjeEt3t3VMbuDhuHIuEZUpfT0y
	dnjazc+ZyWSy4a/W1KMYAOMKEtac9DAQaUltJXQ3qLUTQbjfBJjRY0V9uCNhhq7dZpLfSxVNDRq
	Uy0gdjTx7ITtffw1Hz/EvGMLio1XHo7/tRkPBqDw9ujtUGltRLBMp2VDmfbcb4S8yjkSFcK0bUe
	rrODnoVvXpG0N1D2NJJ0XFj0yyzw==
X-Received: by 2002:a17:90b:4ec5:b0:361:45df:f5 with SMTP id 98e67ed59e1d1-3650ce8ee94mr6243459a91.16.1777803363368;
        Sun, 03 May 2026 03:16:03 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad2bd7sm81073455ad.36.2026.05.03.03.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:16:03 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 1/4] docs: admin-guide: fix typos in workload tracing guide
Date: Sun,  3 May 2026 18:14:26 +0800
Message-ID: <20260503101429.254394-2-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260503101429.254394-1-hank20010209@gmail.com>
References: <20260503101429.254394-1-hank20010209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several typos in the workload tracing guide:

  - sys_opennat() -> sys_openat()
  - annotate the to view -> annotate the output to view
  - sys_getegid -> sys_getegid()

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 Documentation/admin-guide/workload-tracing.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index 35963491b9f1..22cb05025ffc 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -278,8 +278,8 @@ associated with a process. This command records the profiling data in the
 perf.data file in the same directory.
 
 Using the following commands you can record the events associated with the
-netdev stressor, view the generated report perf.data and annotate the to
-view the statistics of each instruction of the program::
+netdev stressor, view the generated report perf.data and annotate the output
+to view the statistics of each instruction of the program::
 
   perf record stress-ng --netdev 1 -t 60 --metrics command.
   perf report
@@ -349,13 +349,13 @@ times each system call is invoked, and the corresponding Linux subsystem.
 +-------------------+-----------+-----------------+-------------------------+
 | geteuid           | 1         | Process Mgmt.   | sys_geteuid()           |
 +-------------------+-----------+-----------------+-------------------------+
-| getegid           | 1         | Process Mgmt.   | sys_getegid             |
+| getegid           | 1         | Process Mgmt.   | sys_getegid()           |
 +-------------------+-----------+-----------------+-------------------------+
 | close             | 49951     | Filesystem      | sys_close()             |
 +-------------------+-----------+-----------------+-------------------------+
 | pipe              | 604       | Filesystem      | sys_pipe()              |
 +-------------------+-----------+-----------------+-------------------------+
-| openat            | 48560     | Filesystem      | sys_opennat()           |
+| openat            | 48560     | Filesystem      | sys_openat()            |
 +-------------------+-----------+-----------------+-------------------------+
 | fstat             | 8338      | Filesystem      | sys_fstat()             |
 +-------------------+-----------+-----------------+-------------------------+
-- 
2.52.0

