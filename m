Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013536;
	b=EiOh1lmCuCJTC74TgyAOfu5YT9MyBS5rDwkdY9FZv3fxV+8cPlCJnbSj60IZODeNd+5g
	 uo+mIST5CUyd5sSX5GmG5nfRKb/8B+wvTUQEZ5CBkEtEuBU+gDtO7MxAOpxwY6jvqpBfp
	 RqzeKHzo6ZOgsnOPMn0EQdbFRV0gY+BJb7sPHT1m/6lrs7ctmuqGgF/UutYoNXqUWcKXG
	 9QyNk+Nn3unND4IQdvst7iixOAUYr2yMrctSCMFAUS405lRuvItbjX0NMN6CkIvfu5Nsv
	 BkhyB51w2FkZxp4nAuEdBL0QwiIEFiM054N0ZhWslQyBnjue6lhkFN5weo0JZgWGmOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=D6FqnEFeAupUPbtnZ9Y7i7Ho9zVceUZfQGwi96SCg9I=;
	b=EIhm5An5Et4LTdD8r1GsXX3z3DmhlvcLw7F0B0VsHgyz4gxeRUN+5nKa7zy39fBjleVM
	 CKJbho/pIQfP4YnBdqRDD5KaHH4DCAyKsN4rwUlnRaWLiWUkiJguEZH9dBnjy64U//Tsp
	 kKPt9C+waFlX4MYtvqPaCVxgtAa55kixR2GXjS2SDFcVBnJ+95tFaP6em4qlGPR6tFJ3J
	 8j3zmz2m24BqckN+er11kaFHd11UFmqXhEL+I2kejemDG/QsUIGPzQkTje5f3i/oCinTN
	 9V0kGGiJPgD6BOe5vhpdJZyZRV2eTho2DJyYmg5VKgUR44M4ExN8X4Ef5Wybq5seyhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NRmH1kvP;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA3606A326
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BA3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NRmH1kvP
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada2f39f30so759641a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013534; x=1793618334; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D6FqnEFeAupUPbtnZ9Y7i7Ho9zVceUZfQGwi96SCg9I=;
        b=NRmH1kvPz7qFtAWbVZFsvnOZ6/+0t8JUGJicS3bi0yLDwYe2AKhAhvLHi5uSQF1xCc
         jHMNCkxomN5acQ5KixulLsc8w8SUdfDMewod+jzUqspz1c8Hddpf9SJeScx8TQhraftF
         wmTOhAmSi+tIq9gkvDu47HNAtCl0fwi43SUbqeOBmWy3l+pmaD0rzROTCx+id9x7dutY
         4iULjgRLJfTVcJiVfYxgkc0nXjRwW2yNFCFmGVbrwsltb7fl8jY7nJoZJRXUspPHwc6r
         YhOK7ZaiOAKz0M0oifjsgJkz5PO+7EIH52SjWJ3vqL0IX9AAdzVfogdZfkslLrlQOpSw
         BOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013534; x=1793618334;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6FqnEFeAupUPbtnZ9Y7i7Ho9zVceUZfQGwi96SCg9I=;
        b=HreqwiGj5pyzKa2jUi+3izbo7jg6aXtqUUHZn9cR7kYICgfkoY4UWFeyipVztFf+Gw
         LZ4xqJGsIYM2tDqmHXYgnNrlu6pMdbolWW7vaoGdlEiRbNnKTNgx75Xciucauymf+QTK
         N6ZYp7SdsHYL0d90QM/tNQassYa468R5m+de958Th25bqmFAyFAkkjny8Yyri2C34cMq
         5gi0SKD0/cZkNOmXS8HamBm4r8pJVgFr8hZWY0ZGKSlwJX0BB+XqLsyC8Jjq8tkHefxe
         PK+xNBf/r1owK01hQV1e2jcgSzEivrVj3gcKC9ytV/EOTwL+AwMWQXp20lI+0638ddDt
         MBRg==
X-Forwarded-Encrypted: i=1; AKwUvBxuF96LS6lBf2wl85MloDON22CHRNse5fJp5s78E5aF0mkA9Kbo1g7qMhOLeDH2MZ0t9ZlUN5MDgjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ72uaTX7LWiemwPeCk9zzXUJmA8MbgWXjKpW12X1SM1isp8IoL
	aTehKD4SnqQ9HnqQ4MCkfE/DjvDN9DrRSimHvCjvDYtUhO64s3EV/FMI
X-Gm-Gg: AYBFou1LtF2zAKPheXp+WmAbYLHHVCsX+doBpIjnXT682/cegOId+GLdWOeTqFAF6i5
	M1hs9JpI+LcGijpJJGgtHxAxuW9RDra+fHrOEH1wWvqLo7msxvB2kNs5cgSzqja1akDJdry95Xs
	thfpJWSexqERTNNT8RO1nXgwEgdFRvu4diZmVAjlWzsjnTc+Nz/o5O+uw3swhgG79lumyb0V9Cj
	es0AzrPxbDSDGpLtzS6Qyx/38Pp92RuXDiLuh32bb5dDLJvh7hh6wHOj+BUNAGbnbaKbITNLPmv
	tFQSGIdmr3PzXQb6q5gG89qPhqwqZa6GXTk7tKQLOpa3Btvl23FNh/+UzD0yH9CSf6pbw1v4+FD
	JzofLThX/cVEshYlB+6yTBxyoeMbyZYRPZDtORsdVH3jpVdjBsqR2xVoQ/I9f/KXd2e60DrIQVJ
	RHWkk/Biero2gMzd/jFFs/8hPuS8HvKEg37+n2BA2AkzgF4DOvrY40aLFcVGfd+Aj3QpR5uz1ZZ
	3hgX9XfCm2yxbQ47N1b+5Ivf8t1KlX8pNXp1vUFs9yy7WXaZBYpA/lprg8rQpmwuOLydK5EBJou
	1hhuji55lT6tJUGE5EdwRleZfR2TNZVweXVHPMyOWmGnG3afrtaU4Yw=
X-Received: by 2002:a17:90b:2742:b0:3ac:8527:3fc5 with SMTP id 98e67ed59e1d1-3ade9b2f909mr4872984a91.3.1793013534409;
        Mon, 26 Oct 2026 04:18:54 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm4783820a91.4.2026.10.26.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:18:54 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] Docs/admin-guide/mm/damon/usage: fix grammar
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
Date: Mon, 26 Oct 2026 22:14:35 +1100
Message-ID: <179301327249.2.6830202812762243627.damon-docs-grammar-3@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

Fix a handful of grammar mistakes in the usage doc, mostly
subject-verb agreement and a missing or extra "be".  Also turn "Below
commands applies" into "The commands below apply", which I think reads
better.  Rewrap where the lines got too long.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/admin-guide/mm/damon/usage.rst | 31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 3c4f3651a244..ffb487defa22 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -23,7 +23,7 @@ DAMON provides below interfaces for different users.
   want more optimized use of DAMON.  Using this, users can use DAMON’s major
   features by reading from and writing to special sysfs files.  Therefore,
   you can write and use your personalized DAMON sysfs wrapper programs that
-  reads/writes the sysfs files instead of you.  The `DAMON user space tool
+  read/write the sysfs files instead of you.  The `DAMON user space tool
   <https://github.com/damonitor/damo>`_ is one example of such programs.
 - *Kernel Space Programming Interface.*
   :doc:`This </mm/damon/api>` is for kernel space programmers.  Using this,
@@ -163,7 +163,7 @@ Users can write below commands for the kdamond to the ``state`` file.
 - ``on``: Start running.
 - ``off``: Stop running.
 - ``commit``: Read the user inputs in the sysfs files except ``state`` file
-  again.  Monitoring :ref:`target region <sysfs_regions>` inputs are also be
+  again.  Monitoring :ref:`target region <sysfs_regions>` inputs are also
   ignored if no target region is specified.
 - ``update_tuned_intervals``: Update the contents of ``sample_us`` and
   ``aggr_us`` files of the kdamond with the auto-tuning applied ``sampling
@@ -258,7 +258,7 @@ writing to and reading from the files.
 
 Under ``nr_regions`` directory, two files for the lower-bound and upper-bound
 of DAMON's monitoring regions (``min`` and ``max``, respectively), which
-controls the monitoring overhead, exist.  You can set and get the values by
+control the monitoring overhead, exist.  You can set and get the values by
 writing to and reading from the files.
 
 For more details about the intervals and monitoring regions range, please refer
@@ -310,7 +310,7 @@ Under the directory, four files for the auto-tuning control, namely
 Please refer to  the :ref:`design document of the feature
 <damon_design_monitoring_intervals_autotuning>` for the internal of the tuning
 mechanism.  Reading and writing the four files under ``intervals_goal``
-directory shows and updates the tuning parameters that described in the
+directory shows and updates the tuning parameters that are described in the
 :ref:`design doc <damon_design_monitoring_intervals_autotuning>` with the same
 names.  The tuning starts with the user-set ``sample_us`` and ``aggr_us``.  The
 tuning-applied current values of the two intervals can be read from the
@@ -538,8 +538,8 @@ Among the multiple feedback, the best one is used.
 Each goal directory contains six files, namely ``target_metric``,
 ``complement``, ``target_value``, ``current_value``, ``nid``, and ``path``.
 Users can set and get the six parameters for the quota auto-tuning goals that
-specified on the :ref:`design doc <damon_design_damos_quotas_auto_tuning>` by
-writing to and reading from each of the files.  Because the kernel does not
+are specified on the :ref:`design doc <damon_design_damos_quotas_auto_tuning>`
+by writing to and reading from each of the files.  Because the kernel does not
 update ``current_value``, reading it only makes sense when ``target_metric`` is
 ``user_input``.  Note that users should further write
 ``commit_schemes_quota_goals`` to the ``state`` file of the :ref:`kdamond
@@ -577,8 +577,9 @@ DAMON-based operation scheme.
 ``core_filters`` and ``ops_filters`` directories are for the filters handled by
 the DAMON core layer and operations set layer, respectively.  ``filters``
 directory can be used for installing filters regardless of their handled
-layers.  Filters that requested by ``core_filters`` and ``ops_filters`` will be
-installed before those of ``filters``.  All three directories have same files.
+layers.  Filters that are requested by ``core_filters`` and ``ops_filters`` will
+be installed before those of ``filters``.  All three directories have same
+files.
 
 Use of ``filters`` directory can make filters evaluation orders confusing to
 expect.  For this reason, ``filters`` directory is deprecated.  It is still
@@ -654,16 +655,16 @@ Users can write and read the identifier of the destination to ``id`` file.
 For ``DAMOS_MIGRATE_{HOT,COLD}`` actions, the migrate destination node's node
 id should be written to ``id`` file.  Users can write and read the weight of
 the destination among the given destinations to the ``weight`` file.  The
-weight can be an arbitrary integer.  When DAMOS apply the action to each entity
-of the memory region, it will select the destination of the action based on the
-relative weights of the destinations.
+weight can be an arbitrary integer.  When DAMOS applies the action to each
+entity of the memory region, it will select the destination of the action based
+on the relative weights of the destinations.
 
 .. _sysfs_schemes_stats:
 
 schemes/<N>/stats/
 ------------------
 
-DAMON counts statistics for each scheme.  This statistics can be used for
+DAMON counts statistics for each scheme.  These statistics can be used for
 online analysis or tuning of the schemes.  Refer to :ref:`design doc
 <damon_design_damos_stat>` for more details about the stats.
 
@@ -722,15 +723,15 @@ tried_regions/<N>/probes/
 -------------------------
 
 In each region directory, one directory (``probes``) also exists.  In the
-directory, subdirectories named ``0`` to ``N-1`` exists.  ``N`` is the number
-of installed probes.  In each number-named directory, a file (``hits``) exist.
+directory, subdirectories named ``0`` to ``N-1`` exist.  ``N`` is the number
+of installed probes.  In each number-named directory, a file (``hits``) exists.
 Reading the file shows the number of data attributes monitoring probe-hit
 positive samples of the region.
 
 Example
 ~~~~~~~
 
-Below commands applies a scheme saying "If a memory region of size in [4KiB,
+The commands below apply a scheme saying "If a memory region of size in [4KiB,
 8KiB] is showing accesses per aggregate interval in [0, 5] for aggregate
 interval in [10, 20], page out the region.  For the paging out, use only up to
 10ms per second, and also don't page out more than 1GiB per second.  Under the
