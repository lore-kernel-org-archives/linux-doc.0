Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795644628;
	b=Fk9AZI/mL2OY+/6jNEC34MTRn5/0rced/XLHpOf3bW1YB073bbkQYXIfooEAAV94Ehnt
	 /dlB8MVzvlZzAL34GOkH+bDSt1wUVNVpmSttQH+CenCZaqbzlnSF9zaNPfduIEpAutymN
	 FX3z8CeObE7BVt3s3Ij64dGMOvimOP41wuNFbkyiSj2YoNHq0w0YeG8oXkzeGygZfHhPp
	 uM6n56uO05Ydy+Bh/ooSMvDxvLxo6djoWabgEknrghUwoesT8xhlz5/URD7Qn+ja5acTU
	 SZq2Zxj62mzlLeYRMghSuDVmao9IZH2w1vbGR/qxZ6cYJDqpF3AexaVJOnkHSHmFozQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CkBk2j5ivR/mh7ILFij97SNuJfGxESxh8j6/caNV86A=;
	b=lmDgW7WyjnZkaBZo61l/yKUQVbK11IDGwkyl4Eyvz4cNd2nc+GFylW4r40FzkvR7JnhW
	 8W+6uBzaQTKM+KFuBTli0RL+Fy9LtfZwFfjDKa8nIP9+UhCQNERosSZvTwaZbDiOa4QP5
	 O8wyqmqDqvgo3gQ3RCGJa5bPe66rSZ7ollfuZrb6efBMrXgALedeHiaIUb2s8bEwSTh3T
	 n/Gh2O6cGPIriUl/f1Bblv2KYbcovWxmYSJGj3ja67+erIUXzFoSDOhrFThL086Zti7tL
	 R1/dcy/8KlgHAB+bADwjCXHNV82ic+9FeN1+FpCsW8Ngax+inVjVit2Ag0Otet8YDRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2F33SEK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A7606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 22:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2F33SEK
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso694452c88.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:10:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795644627; cv=none;
        d=google.com; s=arc-20260327;
        b=UUk+yXU6dRsNB33uz3NpJqYvxXPQF+0csftpdY6W1Oj7y0IvhSJAwKxsWHhTggx/9W
         UH9Lbv7cK+FfE1ID0rlovXOyvxFkkyl9xBAiZXUjF0arhBYGmmt6oripgeVYePnpbmyP
         dWB0dJESrQMgam4LdnuV0Z5R5fW2zHUKZQr5nPNkpXkclnWlX1guTUZYlvkkJQzC4lFk
         cocqIgpCc1ztHZ3VCwBJgFVLDt89dWxcPSR+YVJif1YCls/SRioqwyXklKox/se6DzU5
         rl5cuv6zTIRpndyCfoSOh6VxNKB+MFE1QD9ftXr9H7tgYJo7L/2Y3jpHvKp3pjc3nDqr
         AypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CkBk2j5ivR/mh7ILFij97SNuJfGxESxh8j6/caNV86A=;
        fh=WCaO8+tykGopvqnnVh93P+OoxOmLat5HLx7lA9jAFas=;
        b=rLqpZdfpeRjrV6jk3m0uTVQaxYmo3lUG6sS19XNiWZf4e0VZB46tHdLj8741so/qFh
         GeTSb+GrXkiSjuUBiLv5KEqsKcJV26lCRMWLXbwjL7Y0FI7GLfh735JTNO9Muv3ciziR
         /ZAwX0+2UgDspOTsU3zEvX+eSdUkgk6P5LA3BQ/5EYHyVW5guQC7PLZwV/+iqX2T5uyk
         xeY9SetG8U3LF760jXjfACJ8EVrcbz0jl5pzsLLD7qi9ofV6SZ8fiTPzY8wOiGIHOxKe
         hem69ORTrifN3LWhlk1xYz2PlSbqoaxfIHcWryaVWX4VMyC7rXV9vDtQLGOv5EyxPZaD
         DYlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795644627; x=1796249427; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkBk2j5ivR/mh7ILFij97SNuJfGxESxh8j6/caNV86A=;
        b=E2F33SEKMppxGebUZlDdnoDy2ah80Ba3VF2XrORg85gV5GXRinr/f3rJMfefdQ9bHe
         qoN8G6mIWgsXOHhlrbSbDQSALGHDWittkCQlXpOhSdqn3qmZ9/UCKHkp+AgGScaz6YfG
         eej+x/QOCmlFbssSKtBrttRBNBlhyWXMayOzFKUnc80zXhCKIusyN3HUVxQGpoKWFZGJ
         6xyHOpcgkGsOKGcWLJVhRS9zT0x/7yKtJc+iDtkpDMfGzyRfad0h4Up/E5Y7kYn/CTrJ
         lloJMm5f4uUllV1V6ki7jbtwylpDtSyaJVbkzNl/T1Yttpfm8R6KNwJifFIAZAEDwzeL
         BaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644627; x=1796249427;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkBk2j5ivR/mh7ILFij97SNuJfGxESxh8j6/caNV86A=;
        b=MBiMgUutXLhf7k2ILEUqG3+gRt+MYeireOVytqq5e2x2Z92k5sAcfGJGbyv7haiodf
         2yMMqbhVhks0Q06AeVFI+S3ZYmtbPQS8f0acuFHAAuS+pfx9/XLzEgXSazG/tDh8TkNW
         LTzhaUGsuHdli2BQqAVNSrWK00MyxUnEF03z0YezdmfNCNgGaNuyqXYUcy2z60NIl7la
         wAqK70LJasASpFO/Pt7ntHUl1MjPYjdl8DulvYXrOEnzJhVCgVqoEaQsdKWo0L4glmnF
         usOBqZfdKDGbzxvQwj8/jper0GfZD2JdTJFJ5osczWtk5SYAA7bgXk7OLwcs8FcrRAUj
         3PXw==
X-Forwarded-Encrypted: i=1; AL+hErEIzoXmvjx0s740ij35NLec9PbQbd740bD8Hfs2Swh5uVt3PDhWAcS2MYDiFaOwJG8rf0q+GzNEWqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G9NfRf8JoSGFt7jCinIXdxIuJ4NQc9K59+PeJ0Fy0DkkE1RCV
	MYL1jKcq7KBtOJ8PRg4A1PlstoGIUucS8jFkjS1BO/Owe9NDpbw8XgRE0VEAMJdo6/FEss0Tmv4
	amo2z/VYMD9b9iBEQINkXwTn5jRjKow==
X-Gm-Gg: AZFdTZdUgKGkpKAydCWwNPG53Ym9ad9+kkQnfprZXIZrOw9C2qSoCL0pXUHOWOz2XH4
	NfCtxXotUB+JOdmt2gln/VvSvnMnsDyOdYApxP+wHhE5iyKQK8dBBgGQ9qU/ADQTp8fkdUvtwnN
	e7KMD8GF/s8twNa2/9B4G03pVnKmnPLG6wm9W0UYhyOIeaRCNrvtRkOeWrmKZ2GmK17CkXHeapu
	yhpCw1j8UMFVpRj1Tk3Izdj1kziX5orgrQsHHkiXxnhgB+PmOvXTyEF/ye/8WEyV+bwlvF5dYAD
	j7xmb1CpAMAtt4M9MIREVxrXOn78Pew18tbL6h51sZPGjZ5sFPVKkkezH4MXol+56se1wZgyb5E
	o8A9F6M2KO8Q9dfdSWrzeFzMCtd0FTOKInCV5
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id
 a92af1059eb24-1b556908ecdmr17988038c88.40.1795644627021; Wed, 25 Nov 2026
 14:10:27 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124153636.91854-1-sj@kernel.org>
In-Reply-To: <20261124153636.91854-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Nov 2026 14:10:15 -0800
X-Gm-Features: Aa3M54o3hTkahzH_49Bjbc7Zx-dgkzZBTJlliNIgBcED_vBed0zNdkBdD-nvRds
Message-ID: <CALa+Y14BNfdWH3yBY+ky1+Sb0YvRzW=gRcKKyGWWaBQkysPUkA@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] mm/damon: let users report their data attribute findings
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

I tested v2 as it is in mm-new, and wanted to share what I saw.

How I tested:

The guest is x86_64 with 8 CPUs and 4 GiB of RAM in two NUMA nodes.
A paddr context watches 1 GiB of node 1, the physical range
[4 GiB, 5 GiB).  Every 5 ms DAMON samples an address in each region,
and the context's probes decide whether that sample counts as a hit.
User reports are submitted through the sysfs producer files.

The context has three probes:

- one with a REPORT_MADE filter for user_report, matching=Y, allow=Y:
  it counts the samples that find a report;
- one with the same filter but matching=N: it counts the samples that
  find no report;
- one with no filter: it counts all samples.

For each test I compared the hits of the first two with the number
they should be, as a share of all samples.

I tried four cases:

1. A report that starts exactly at the sampled address, with
   addr_unit 1 and 4096.
2. A report over the whole watched range, kept fresh by one to
   sixteen writers re-submitting it, slowly and then as fast as they
   can.  Every sample should find it.
3. Reports with an empty or inverted range, next to one valid report.
4. A REPORT_MADE filter on a vaddr context instead of paddr.

The DAMON KUnit suites pass.

What I saw

Case 1 works now: with the addr_unit fix in v2, those reports match.
Thanks.

Cases 2 to 4 do not behave as I expected:

2. As the submit rate goes up, two things go wrong:
   - with matching=Y, the probe misses the report more and more
     often, although it is always there;
   - with matching=N, the probe matches more and more often, although
     it should never match.
3. Empty and inverted reports are accepted.  They never match, but
   they take queue slots, and enough of them push the valid report
   out.
4. On a vaddr context the filter is accepted but has no effect.

Where it comes from

Case 2: a busy report queue (13/27, 14/27)

When a lookup finds the report queue locked, for example by a submit,
it answers "not found" rather than "don't know".  For matching=Y that
is a miss; for matching=N it is a match.  The more writers, the busier
the queue, and the more samples go wrong.

The right answer here is 100 % of samples for matching=Y and 0 % for
matching=N.  What I measured (the last column is the share of submits
refused as busy):

  writers               matching=Y   matching=N   refused submits
  1, one submit per ms     99.5 %        0.5 %          0.1 %
  1, back to back          45.5 %       55.3 %          0.2 %
  4, back to back          49.0 %       51.3 %         60.2 %
  16, back to back         15.6 %       84.9 %         79.9 %

The numbers vary somewhat between boots; the trend does not.

Could a lookup that finds the queue busy skip that sample instead of
counting it as a miss?

Cases 3 and 4: input checks

Two smaller things, both about inputs that are accepted but cannot
work:

- Submit accepts a report whose start equals its end, or is above it
  (22/27, 23/27).  It never matches but takes a queue slot: with 1000
  of them after a valid report, the valid one is found in only 4 % of
  samples.  Return -EINVAL for these?
- A vaddr context accepts a REPORT_MADE filter (16/27), but the vaddr
  operations never evaluate it.  Refuse it for non-paddr contexts for
  now?

A minor nit in the cover letter: the loop
"echo submit > producer_state" runs in producers/, so it fails with
"Permission denied".  It should be "echo submit > 0/producer_state".

Thanks,
Ravi

---
The case 2 setup, for reference (paddr, node 1 = [4 GiB, 5 GiB)):

  A=/sys/kernel/mm/damon/admin
  C=$A/kdamonds/0/contexts/0
  echo 1 > $A/kdamonds/nr_kdamonds
  echo 1 > $A/kdamonds/0/contexts/nr_contexts
  echo paddr > $C/operations
  echo 1 > $C/addr_unit
  echo 5000 > $C/monitoring_attrs/intervals/sample_us
  echo 100000 > $C/monitoring_attrs/intervals/aggr_us
  echo 100 > $C/monitoring_attrs/nr_regions/min
  echo 100 > $C/monitoring_attrs/nr_regions/max
  echo 1 > $C/targets/nr_targets
  echo 1 > $C/targets/0/regions/nr_regions
  echo $((4 << 30)) > $C/targets/0/regions/0/start
  echo $((5 << 30)) > $C/targets/0/regions/0/end

  # probe 0: matching=Y, probe 1: matching=N, probe 2: no filter
  echo 3 > $C/monitoring_attrs/probes/nr_probes
  for i in 0 1; do
      F=$C/monitoring_attrs/probes/$i/filters
      echo 1 > $F/nr_filters
      echo report_made > $F/0/type
      echo user_report > $F/0/filter_report_type
      echo Y > $F/0/allow
  done
  echo Y > $C/monitoring_attrs/probes/0/filters/0/matching
  echo N > $C/monitoring_attrs/probes/1/filters/0/matching

  # one producer covering the whole watched range
  P=$A/reports/producers
  echo 1 > $P/nr_producers
  echo user_report > $P/0/report_type
  echo $((4 << 30)) > $P/0/addr_start
  echo $((5 << 30)) > $P/0/addr_end
  echo on > $P/0/producer_state
  echo on > $A/kdamonds/0/state

The writers are 1 to 16 copies of a small loop that writes "submit"
to $P/0/producer_state for 10 s, with a 1 ms sleep (the first row) or
none.  Hits are read from the damon_region_aggregated tracepoint's
probe_hits.
