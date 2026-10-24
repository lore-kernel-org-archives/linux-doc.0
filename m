Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848124;
	b=DKlOiFJ+Wchrcjal/AFA5MV0dD6klPkvQRpLWLkas541L81zT9mPqgaYeo0/c7Jh3rQR
	 ozASUJJM6JV2zkz248sPRAy9C1RG/AQIx2EF42i1WvfuHJfDR2Hga4aLQpRCgt8YD/mal
	 +VONVfv6eCabvc3bzDOOlt+8n+9d3O2ELmlwCzKasSw1EaPJSwvMmfRieul4B9TcaHQfW
	 hOEOG7v1vgQ0+NCKeYMbd/riWQUSLrytg2HzpvmKyc7FsWYtim0EViBQHd7shlAq0yU3r
	 +cdVleKF3YpaXem/TaFNG19jQD2rYmqHOvH4f5RgnPwPU5p5Fm5Q6zD2NJGi90SjGBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O33gJviJ+cAbw95xWmlrZRFrZkkcoSO6zGdj9BO6kQY=;
	b=C/pLlhyDY/ylp1Lxj9OBJrhoHz8RYccdjylqw2u278HCaIpNHbntgTqdD3PZG2zFO0nT
	 IJQbQ+xcGxoF3QLUfl+rNowzZYVkEPhF6PLrpR2AvBtH6rcUkZ0U1YdamdGoU7HLhtH8t
	 ol3qg/yFBqmkWFrS/Fa3kWnOOcyZuIj4O3L0TRxSDLsRXCdLMyIJoxUeyvicuLCiIa/Ol
	 P9DmWH59G9L4qAqAjeXjUNqXW9VMKJx1hBeN4kfBrfBo67xqMcd42X8/e+l6xhtyJeXr5
	 ayARGEwdhJspXOsG71WKtN/Ss28QutzK+LiHewKhzuvBk/BAH0x2xBiZ9W+tc2DEoag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ohr86IK9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDE606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BDE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ohr86IK9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35ef6b49813so2596439eec.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848123; x=1793452923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O33gJviJ+cAbw95xWmlrZRFrZkkcoSO6zGdj9BO6kQY=;
        b=ohr86IK9oNB1EDhFz7xRJfThq5/oTLgStnERZJcFDNlFBpT1aH+zHI/yARSBBFnxnZ
         60vaQHN0NjXrIRQ+0KroDFOQ+Vyx92Lbvb319D1L5dylIQnHhOhNe1nB2PRX9ar0boVc
         SV56BA2dE+aeu/XMMiubyT05lQ7+r/pMWQQhlBJt23hHDsSzoqCf+yXD0PMrTq1u5Qrd
         sEkebmJUZkp6jmmHcuDV4hav9MWxW+hG5pmnXe3pKl8TRkrCNyXBqNpbRhaUh9fIIr72
         A7sSMVXxNCXOaV67lQxLTLewErP4+wUIF4RXSkZoLXo4TxLLBuMzlN7oEsvkR4MMqw0n
         Nbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848123; x=1793452923;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O33gJviJ+cAbw95xWmlrZRFrZkkcoSO6zGdj9BO6kQY=;
        b=sVElHD125Ipg1Bpm7k6elV0+keHayvVsvz9FI+7fO8AyxoyoIBOmL7lhcK2CReiZYy
         jdq3X4TabmAny5dzOUoUWfKq35Vlyig9TsQ0igQ/SrhH/c4Ud89FPnXiCcrJE4h0eiLE
         MWTMhryflxkTK5iP/NZOuQlF1irb4o6RDFLBRgSl40viQh3h17XyKxtTnh1uCpvVfMdU
         1daHy8306fF54F7howLXnn0dT+ND1K96qCg2Q9x7fFlTdv4C+cv6CPpiR23C+aIyEDDX
         MaEpTPlb+EzPfYmLfNwMYh894nS+EKg8aheDOJBbAkFPrF6SBpI/iqG4gf3FgvMZoVtC
         h2tA==
X-Forwarded-Encrypted: i=1; AKwUvBwc6OaaIwZOJKDxSjH+9K5gcKLhWIFK5Papb7meGitAkvvWVSNBmItfx1nobgxT7pBsojs/N2EVuko=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlvjYDB+DeJZj/XaHQCQSfkG25KvTlH0mEM3ie0zH1GhdwlZeQ
	t3/9b9XEREqCs7UttwwvgWS4L76ISyCD85npxF3gVTuWQovFkAtOK0wX1qwsk4E7
X-Gm-Gg: AYBFou0Ouu2zZRKojFJFqCgGDsRXmQE89eokqzKgl0Evro/7t9/Tf1n/i63sUyKBaR2
	awG8uIzkSw1gNHw6pw3QXYq/EWOYm8y68TAlMK6rrtVJHwbiW71mfMIQ6Tf2QCDI3+npNNGOG8k
	jocf/O/VDFV+r3MpszHOkPIDH74aVCQd/Wj8Iy9QvkQ8HdVKj71iQmNQfmnriMTHO93Cr1DAveO
	IvLTbaKAMtZe5hHTkq9OnoqTEwgnmgknR1WNgfYmFxcbc8DJzwI7jxEOwgt5fAJwMRxURMhYRqR
	mIgWJjKj0SanUZTe1RsLgBHXp1uBsam1qytN1PFDArhEwCZ50YouTiq90PTjaP1dpMqAzSIEegj
	uQzEzG2V/WJN81i+uTERLXfgCHEU4zwduyGP+8RFR3+xgI1GbtuuqDZtHsHY3azRXKVbIIuU+np
	B8SvEeqmw1KxrWp7BXZqFxrwY8I0gRYW7t7QOe41fe8kPW/AUl6NanjPb9amaIYlvZi+lfngh60
	kdiXVrA/s3gzKMs/lbWLSNgiRNoSXo71Y3aNrWN+oZD6eDV/bPj/umWtQYjh8p8dDPrS0dGOGju
	hzLtjw7qLE1LMtmpQS9ORda3UzmhdGtIOp77AGkzQL4uCPxUNbJ7Tly6GlsRMP1uuQJTcAACKqN
	l5oxHcJfP
X-Received: by 2002:a05:693c:20c5:20b0:35c:2261:8119 with SMTP id 5a478bee46e88-369e84fa22emr2930662eec.6.1792848123103;
        Sat, 24 Oct 2026 06:22:03 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:02 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/11] docs/translations/pt_BR: process: sync with English and fix errors
Date: Sat, 24 Oct 2026 10:21:47 -0300
Message-ID: <20261024132158.39493-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series reviews part of the Brazilian Portuguese translation of
Documentation/process against the English originals.

Patches 2-6 sync coding-assistants.rst, security-bugs.rst,
maintainer-netdev.rst, maintainer-soc.rst and changes.rst with changes
made to the originals. The other patches fix translation errors against
the English text, markup that renders differently from the original,
and cross-references that pointed to the English documents even though
the targets are translated, adding the pt_BR labels needed for that.

The changes are limited to updates and fixes; nothing is rewritten.
"make htmldocs" builds without new warnings.

Daniel Pereira (11):
  docs/translations/pt_BR: process: fix 1.Intro.rst and add labels
  docs/translations/pt_BR: process: coding-assistants.rst: add bug
    procedure
  docs/translations/pt_BR: process: security-bugs.rst: sync with English
  docs/translations/pt_BR: process: maintainer-netdev.rst: sync with
    English
  docs/translations/pt_BR: process: maintainer-soc.rst: sync with
    English
  docs/translations/pt_BR: process: changes.rst: sync with English
  docs/translations/pt_BR: process: license-rules.rst: fix lists and
    table
  docs/translations/pt_BR: process: 2.Process.rst: fix translation
    errors
  docs/translations/pt_BR: process: fix cross-references and list markup
  docs/translations/pt_BR: process: restore links, emphasis and headings
  docs/translations/pt_BR: process: fix kernel-docs and enforcement
    statement

 .../translations/pt_BR/process/1.Intro.rst    | 382 +++++++++---------
 .../translations/pt_BR/process/2.Process.rst  |  48 ++-
 .../pt_BR/process/3.Early-stage.rst           |   2 +
 .../translations/pt_BR/process/4.Coding.rst   |   8 +-
 .../translations/pt_BR/process/5.Posting.rst  |  24 +-
 .../pt_BR/process/6.Followthrough.rst         |   2 +
 .../pt_BR/process/7.AdvancedTopics.rst        |   4 +
 .../pt_BR/process/8.Conclusion.rst            |   9 +-
 .../pt_BR/process/backporting.rst             |   6 +-
 .../translations/pt_BR/process/changes.rst    |  61 +--
 .../pt_BR/process/coding-assistants.rst       |  45 ++-
 .../pt_BR/process/coding-style.rst            |  14 +-
 .../pt_BR/process/email-clients.rst           |  12 +-
 .../process/embargoed-hardware-issues.rst     |   2 +-
 .../translations/pt_BR/process/howto.rst      |   4 +-
 .../pt_BR/process/kernel-docs.rst             |  16 +-
 .../process/kernel-enforcement-statement.rst  |   1 +
 .../pt_BR/process/license-rules.rst           |  18 +-
 .../pt_BR/process/maintainer-kvm-x86.rst      |   2 +-
 .../pt_BR/process/maintainer-netdev.rst       |  76 ++--
 .../pt_BR/process/maintainer-soc.rst          |  20 +-
 .../pt_BR/process/management-style.rst        |   6 +-
 .../pt_BR/process/security-bugs.rst           |  53 ++-
 .../pt_BR/process/stable-api-nonsense.rst     |   2 +
 .../pt_BR/process/submit-checklist.rst        |   4 +-
 25 files changed, 482 insertions(+), 339 deletions(-)


base-commit: f857ff5bf007f3394b704e200096571cbffdcc3a
-- 
2.47.3

