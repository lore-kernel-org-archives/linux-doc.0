Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964711;
	b=TU6qZ07PqTQcj5+VkuGqMN5yJwJK3rfJebD0vFVDp5atyqb85xtelkCG0JcK9V3p+qxW
	 ZjGwTbqxJDyF8vDG/OagFgVvEgmBFCJJyuwubHRnZJppdCKQoy+00AZkHEKWGa4tsQY3Y
	 To/R2Ce4z9v1eDAWkOEsyPEhoUzq5iG969Pxgen5UjkRjnAluRbKD/k6UPRP/yLB43v4S
	 0+snu3kShlNaUtaimVblFKE8TWsEaujKvsV8qSWI0vUI38eGzDMk6jWlylOO4Dc6EdT8i
	 JLjYi4DsANMFvS7jxD/mloeZCDv9e2jq1bDVbL5ySH6y4asPzuWxjdUy38w8JEEkJuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jOrvEN+KVCGlTSI7YSpq2m2C7VkxLE0ZfmB8g9JVNC8=;
	b=I5QtBCYO4PMir3R2Rg4CLJfYX89VaO+eZwzFX4aVJ+Kc0b6dNYJLRPw7f4ucZkusmcS5
	 kPbC+DG2JHZlwrDJMfZk7mQ6aNg7P83HGC6T/1P2CsoUU1dtZqsAvbcjordP32J0zcXgt
	 gMbuH4jFHlu9iY+qEscD5daBR0HfoKY9iXfMG+hDAiZkVq2hTDmPBxLQgRX6Jka50vzMG
	 2zp/Dn/BsZIIQiEVreZW1Cv0HIFAcQ8KLw6Bynvd8PrDxWhwLCk4TVtXKxsJmqXwCk6qE
	 +TKD2yfYRsu/90KXzWULS3ynp9ZHw01/hLP/KzfEpdW4cDQ/mKBoJKE2t+GBbpFZTOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEt55960;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD7606D808
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABD7606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEt55960
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso41885a91.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964710; x=1794569510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOrvEN+KVCGlTSI7YSpq2m2C7VkxLE0ZfmB8g9JVNC8=;
        b=VEt55960C6+bosFlCaBbLOI7dtjFkFGX5gLOLAST7jc7/yJmZeAlUgl7J6uwy/RSK9
         Xm676Arw7uPQAqfnBG7FCePWEJQhu10WsEMRIhwINeL1bDTHp/innmOkxbpgzG/DXU81
         5fGUWzOhVm4RlU6l7Woei/9ntCMJsbn7O6cT3F7EFiXodurL9HzFlVpR2MkWvGBO8iRS
         sOlyLjx5Mh8ykyVAAB2nC8OqhJ9FXCwj3+NidIT33vU6oWhmDhjws+DYnmcn8JfklHv+
         RAlIhUMeupt90jttFQsu3yHqvkqB8TMtQZTDcKIfrDP+G/AQtlL7DjM12msXfL/zdZ5r
         dR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964710; x=1794569510;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOrvEN+KVCGlTSI7YSpq2m2C7VkxLE0ZfmB8g9JVNC8=;
        b=djHo/R+qOnCoGpDt0ryu35+M4zeb/vgYkdhj3y9y1WCXKTGi4yZrPHs6tKT7rL4jq3
         hirP4SP6TMgQ9/wihs5ODe9OS3CqEoDMtNKbmntZmsGSBh8sNnsrO9b1FnPGCXGsCKuj
         JMAtdVadqpuHq+TMUvzgcbuJt+VesVwNVmzdy+Io45x0Q46jg+xsPs9mfemgo8OYPmUr
         HDcDwqpy9eIyOGpiEOdPxoBOhG8Ntto5IGJ7832P/VTE1GPocBV0SCYNUDt84vAki2/k
         141D4dxBSEyMqm/2ipYoNKFLWlMkDXGaZDumeA4FQVn6j8CGk/Jc2DJUvuRN8bVjlIMS
         VVRw==
X-Forwarded-Encrypted: i=1; AL+hErEb2cr3+GFsRN9ZcfMNQrtbqO/zGKykZvWHUdx3d3HsxJk6eQPCJsHaQJrExD+ifLtuS0B/nKDylqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z92yo+qBIg04v9EBIh4TWzK8Bh3a2xm+WMDu3Hwd4TYastC5IcI
	tccbInSCXYZ8x5aF0dSJQGEPXFC8SchOvo9iwXLknbLkwDL0ThiR/tMMvIBaO10d
X-Gm-Gg: AYBFou3KJMbNYfLPz1Hc77Zr+1uFR6EXMlCchHYKjwRKQnG6wg5EkN5sSCeKr9D3r0R
	AwlEjT5uQQZVjCm1q/nuXPj6d4QnLzQFKGtgkWkEzWoJTBwKnec4TBqNAtxnvQgqQc+Kj8VdWs+
	+p+202GQxVQz40eD7oQb2L+oUcGloCFaHFqCRnxa3txfwu633kINnDe73JdztFV222qyNShlpLC
	7Jvu9pd0xd+lpPSJhOk8oh6RLZJ8DzvTVDtdRWUYgEf5qBKZnwVrwYf6BSTFAgv5kyZSAI0MrID
	aDOZqBIRdz9MGBnx/AUp5S91FH+yYe48v2FrptzuxgJvtsEjlxBqwOO6m3KFGls4vqrqTxmW0IK
	GRrKwT9sg6uI26W6+gziKi6Af12jJ9VGgkrkOo/51mmqdw6VV2Ohg32Lx2LhjmLDS/B9llvL+Hi
	c8cX/9NiNZLFRtQ82oK9rp0bkfV6PWpOPDg9B72MO0UB+mF2sfndfkiJCsv2pNfyMNf2SXU01dX
	R+MEpkis6mWHuhesGzRBlKYnfiA1XkbmFQuSqgk1tswloR1wRMui95AuspID9PiG3radhclsP3q
	toJ6rF6foD+bUP6fgqHDUu8lUI2z2ssfyChjaXgHU+Pzl39CrktN187wjIK024/DAhKo0QjtJc9
	S1U6Ljt8w+KSdZic2dggc2R2M
X-Received: by 2002:a17:90b:1c87:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b0db6cdd38mr3241251a91.4.1793964710071;
        Fri, 06 Nov 2026 03:31:50 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:31:49 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 00/25] docs/zh_TW: process: resync translations with the English originals
Date: Fri,  6 Nov 2026 19:31:15 +0800
Message-ID: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series brings 25 of the zh_TW process/ translations back in line
with their current English originals.

The "update to commit" markers in these files cannot be trusted.  While
preparing the earlier process/ terminology series I found translations
whose marker named a recent commit while the text still followed a much
older revision, so every English change in between had never been
translated.  checktransupdate.py takes the marker at its word and cannot
catch this.  Each file was therefore compared section by section against
the full current English text, not just the diff since the marker.  Each
commit message lists what was added or removed, and the marker is reset
to the latest substantive English commit.

Mistranslations found along the way are fixed in the same patch, and
leftover mainland Chinese terms in the touched text are localized.

Not in this series, to keep these diffs reviewable:

 - Whole-file terminology unification (e.g. 補丁 -> 修補程式,
   許可證 -> 授權條款, quotation marks -> 「」) together with an update
   of glossary.rst.  This will follow as a separate series, so some
   files still mix old and new terms for now.
 - programming-language.rst, whose current marker points at a merge
   commit; it will be resynced after 7.4-rc1.

checkpatch reports "Unrecognized email address" for some lines in
2.Process.rst and submitting-patches.rst.  These lines describe tags
such as Cc: and Acked-by: and trigger the same warnings in the English
originals.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Chen-Yu Yeh (25):
  docs/zh_TW: process: sync 1.Intro.rst with the English original
  docs/zh_TW: process: sync 2.Process.rst with the English original
  docs/zh_TW: process: sync 4.Coding.rst with the English original
  docs/zh_TW: process: sync 5.Posting.rst with the English original
  docs/zh_TW: process: sync 6.Followthrough.rst with the English
    original
  docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English
    original
  docs/zh_TW: process: sync 8.Conclusion.rst with the English original
  docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the
    English original
  docs/zh_TW: process: sync code-of-conduct.rst with the English
    original
  docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English
    original
  docs/zh_TW: process: sync development-process.rst with the English
    original
  docs/zh_TW: process: sync email-clients.rst with the English original
  docs/zh_TW: process: sync kernel-driver-statement.rst with the English
    original
  docs/zh_TW: process: sync kernel-enforcement-statement.rst with the
    English original
  docs/zh_TW: process: sync management-style.rst with the English
    original
  docs/zh_TW: process: sync security-bugs.rst with the English original
  docs/zh_TW: process: sync volatile-considered-harmful.rst with the
    English original
  docs/zh_TW: process: sync 3.Early-stage.rst with the English original
  docs/zh_TW: process: sync coding-style.rst with the English original
  docs/zh_TW: process: sync embargoed-hardware-issues.rst with the
    English original
  docs/zh_TW: process: sync howto.rst with the English original
  docs/zh_TW: process: sync license-rules.rst with the English original
  docs/zh_TW: process: sync stable-api-nonsense.rst with the English
    original
  docs/zh_TW: process: sync submit-checklist.rst with the English
    original
  docs/zh_TW: process: sync submitting-patches.rst with the English
    original

 .../translations/zh_TW/process/1.Intro.rst    |  16 +-
 .../translations/zh_TW/process/2.Process.rst  | 176 ++++----
 .../zh_TW/process/3.Early-stage.rst           | 192 ++++----
 .../translations/zh_TW/process/4.Coding.rst   | 414 +++++++++---------
 .../translations/zh_TW/process/5.Posting.rst  | 141 +++---
 .../zh_TW/process/6.Followthrough.rst         | 247 ++++++-----
 .../zh_TW/process/7.AdvancedTopics.rst        |  53 ++-
 .../zh_TW/process/8.Conclusion.rst            |  27 +-
 .../code-of-conduct-interpretation.rst        |  16 +-
 .../zh_TW/process/code-of-conduct.rst         |  54 +--
 .../zh_TW/process/coding-style.rst            | 286 +++++++-----
 .../debugging/gdb-kernel-debugging.rst        | 104 +++--
 .../zh_TW/process/development-process.rst     |  12 +-
 .../zh_TW/process/email-clients.rst           |  78 ++--
 .../process/embargoed-hardware-issues.rst     |  51 +--
 .../translations/zh_TW/process/howto.rst      | 182 ++++----
 .../zh_TW/process/kernel-driver-statement.rst |  24 +-
 .../process/kernel-enforcement-statement.rst  |  59 +--
 .../zh_TW/process/license-rules.rst           |  86 +++-
 .../zh_TW/process/management-style.rst        | 294 +++++++------
 .../zh_TW/process/security-bugs.rst           | 296 +++++++++++--
 .../zh_TW/process/stable-api-nonsense.rst     | 243 +++++-----
 .../zh_TW/process/submit-checklist.rst        | 159 ++++---
 .../zh_TW/process/submitting-patches.rst      | 338 ++++++++------
 .../process/volatile-considered-harmful.rst   | 115 ++---
 25 files changed, 2109 insertions(+), 1554 deletions(-)

-- 
2.43.0

