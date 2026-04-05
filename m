Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C74AEE2
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775414577; cv=none; b=PgObZ0ndBN8ubvOCzLnzwR2I/YpXKCSYE7jhtlpKnqsxNcYddq6d699Sc5X2SapUhgs9qpls+zVVpQ6IgJADPEHCi0GzkG7a4yZ4JKqN5n/BQWOwEdKZdVNDhBfPN0pDQlOA3uPwByihI+mZ7lIJsmUGAmoB0aWfW6EiPBj0kaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775414577; c=relaxed/simple;
	bh=xfVrnxET8urSIUc3VY+td3Hzf9wgzIwRqvFECeVXMR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqEguVsT8K4i0+DHFj/yVE0MKRHZUz/ECioWKBahsXf6eqTctXhdRxzR2GgYmh5Fzynq5eUPCBjuISbPpZfno6yIKeW64vEAH36G6YRhxC1GR81t/5Gb3XzjtzZzO5J9nA9IE3OrYw6fapkOVFecxl1Ay0L0Mx87CDD2hEvR324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIy5cyKa; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIy5cyKa"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-79c20063a32so32910107b3.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 11:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775414574; x=1776019374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=la/BeibUlIJDCZTiPwSwWhDiM4TsgARxgnUgElwvrao=;
        b=rIy5cyKavVGzWhNP/CJfoINmoN5OdzSvaez3EblV8QqM43wF3cgGJHCClzcjhp55pE
         Ja2bUS/yWSKs5odUY9mjey6bmwCS6dWyReg/1OMptaB7BktSDTAFIOCEQGOlR4tzIZq+
         uoo84cmrUuTO7nHRulmLLHa57nMhm1/OPLAZg6eCiPmD21OT1LlUuCKmRAAKOU+H5IFM
         jpKrvERLrXvuDQYlwoVbI2lM7oEY7t6o9Y8c+wwYJl0j2K6dONQmOoPRHt/z2lJQh07E
         y7qNo7N6NUfrCweOSlcOwxNBST1DCkVNUlI36OjLjtqYXwUnsJ2zPkhuRIP21jGUuD2f
         fsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775414574; x=1776019374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la/BeibUlIJDCZTiPwSwWhDiM4TsgARxgnUgElwvrao=;
        b=WYb7rHymqCjWwEZchBA9uuDajFLMxPGs20ihMpj4SYO81bNhoeT8Vhfb7bttlkr/iZ
         Vpi+ImwCCiBz07zkiR6pYBHTZExyNEn25Lr1UowtB4+AVdTYjFQLRGd+c9IqL7/AC31I
         Quvi/U2DqUCAX2uWbTtJMpJ0p1R89VVymzp1Z2xAywHSlQefxr0+PoBLBzIXNVAxr5rZ
         Fe4dw39vvTuTd6AoOdLftr0h3qRDNy8mqs6RVNMRK+NDAWaUJISu2KbJs3J3DQ6A9Cok
         PyCd02zIgIDgofrWciwZjZsOWq2ua7NTklMcbrTNKV+Vv47Z3muaUY/CFQfaMG2Z5GoR
         Gdgg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2YHVvoktQEQoMhkzZM9vVoSUq3AcTYEbk8VkJkMvvhqX5hoAopOvQl9NLXEjozMJOKfrji/rs2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGXLrKoHE9hR6kwk1VlRu3owLaCdj06FGEF+WVhwfyqIOqpTfy
	4FhyISFecT9GnnW8P+2AwnUmT+ogT5IVzqxir5x9L/8yPu1cLMAcZQo=
X-Gm-Gg: AeBDievUqWiVO3L4ZsF06Jp5Sxo7NK/FKNHMqKLTXdCzZZJGMvG0e+TqO6algNkL9ic
	KbC2xsH0/UCPrEYOC58hnGVTIlEN8DJWYSD8sQ+9WcsLajxqhLdDGgQwPbS8MtiViqXK21n3fi8
	FNv/AyRU7MGXUhheVRlWkJ3kmUs1tuhhhKbMDep4HjihP5PkGyKi0OzGFl3IXC7QAUBEwrNDoiC
	jQ2gRfsRg8HHUQgGFxNrG2NiiSBYdjsMAKNXeR35gmWgHWqUaAK+BFmYieP6B5H757WPAdxK/+a
	0jf8AgCVesTE46jyYh82GaapS69n8M+LQGezJdGi0BcNGmDnVQ5S7qqjOv/nRtnk5EZmnjMDpVv
	0Jn9rtfIoZgTvRB4+d41ob40abl1M9CcsgsnjdMXUQwNVVLRny32oSwP/0V/Fx3EgkVSHeLBQE6
	kx7DSeNXCXrzGkFZIA/UO48pmLEY0QU56t+H50sVOesZdEh9aqhP+9Vl1QmRpfIvce+8BhxtfGG
	g==
X-Received: by 2002:a05:690c:1e:b0:798:c633:d13b with SMTP id 00721157ae682-7a4e17512c2mr81212917b3.24.1775414573586;
        Sun, 05 Apr 2026 11:42:53 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42fd37sm44685627b3.1.2026.04.05.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 11:42:52 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [PATCH v6 0/1] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
Date: Sun,  5 Apr 2026 11:42:46 -0700
Message-ID: <20260405184247.2690-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v5:
=================
https://lore.kernel.org/linux-mm/20260404012215.1539-1-ravis.opensrc@gmail.com/

- Rebased onto mm-new instead of damon/next for sashiko review
- Removed Reported-by/Closes tags per maintainer feedback (not needed
  for bugs found before merge)

Changes since v4:
=================
https://lore.kernel.org/linux-mm/20260320190453.1430-1-ravis.opensrc@gmail.com/

- Fixed commit message description for DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP
  per review feedback
- Added clarifying comment for ops-common.h include (for damon_get_folio())
- Fixed build error when CONFIG_DAMON_PADDR is disabled by adding
  #ifdef CONFIG_DAMON_PADDR guards around functions using damon_get_folio()
- Dropped RFC tag per maintainer feedback

This patch is based on top of mm-new.

Background and Motivation
=========================

In heterogeneous memory systems, controlling memory distribution across
NUMA nodes is essential for performance optimization. This patch enables
system-wide page distribution with target-state goals such as "maintain
30% of scheme-eligible memory on CXL" using PA-mode DAMON schemes.

What These Metrics Measure
==========================

node_eligible_mem_bp:
    scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000

node_ineligible_mem_bp:
    (total - scheme_eligible_bytes_on_node) / total * 10000

These metrics are complementary: eligible_bp + ineligible_bp = 10000 bp.

Two-Scheme Setup for Hot Page Distribution
==========================================

For maintaining hot memory on DRAM (node 0) and CXL (node 1) in a 7:3
ratio:

    PUSH scheme: migrate_hot from node 0 -> node 1
      goal: node_ineligible_mem_bp, nid=0, target=3000
      "Move hot pages from DRAM to CXL if more than 70% of hot data is
       in DRAM"

    PULL scheme: migrate_hot from node 1 -> node 0
      goal: node_eligible_mem_bp, nid=0, target=7000
      "Move hot pages from CXL to DRAM if less than 70% of hot data is
       in DRAM"

The complementary goals create a feedback loop that converges to the
target distribution.

Testing Results
===============

Functionally tested on a two-node heterogeneous memory system with DRAM
(node 0) and CXL memory (node 1). A PUSH+PULL scheme configuration using
migrate_hot actions was used to reach a target hot memory ratio between
the two tiers. Testing used the TEMPORAL goal tuner available in
damon/next and mm-unstable.

With the TEMPORAL tuner, the system converges quickly to the target
distribution. The tuner drives esz to maximum when under goal and to
zero once the goal is met, forming a simple on/off feedback loop that
stabilizes at the desired ratio.

With the CONSIST tuner, the scheme still converges but more slowly, as
it migrates and then throttles itself based on quota feedback. The time
to reach the goal varies depending on workload intensity.

Note: These metrics work with both TEMPORAL and CONSIST goal tuners.

Ravi Jonnalagadda (1):
  mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal
    metrics

 include/linux/damon.h    |   6 ++
 mm/damon/core.c          | 188 ++++++++++++++++++++++++++++++++++++---
 mm/damon/sysfs-schemes.c |  12 +++
 3 files changed, 192 insertions(+), 14 deletions(-)


base-commit: b47b4fa4c232ee36aae58630e9d6520e35d33f3a
-- 
2.43.0

