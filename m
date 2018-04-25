Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C990D7DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 17:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755591AbeDYRRc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 13:17:32 -0400
Received: from mail-wm0-f41.google.com ([74.125.82.41]:53695 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755151AbeDYRRb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 13:17:31 -0400
Received: by mail-wm0-f41.google.com with SMTP id 66so8411545wmd.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=QGj5l9iQhhg5cy9N/m7ehbKh06pwXhVp7Me6qkFgHbc=;
        b=ARL5O5PrhzPQUUg749+kP2PG6sSCY2LJmhaUnqea+dInEOmltUyX9VjvJlLpzG931Z
         x2GHDBisfRT99WCOIHcNwMGjYXi3lgrZw53WWx3/XxSDgglSI0yeEWF078XEr/H37r6k
         V/QTfBD1v9uIngqx250yMjPexp/dRv9puCIAQ4u4wQrB0oMC2vS/q5ayz3m8NgwkU51g
         Nojln/4KLFZAG4T1WlP2mpztz8jrPCe4nuZCTblPx6Eywt5nA7p2SoFkswzkn10DYCPK
         qDe8G3dG7nWQ6K/bAz2XEL4KMKqfk2K3/qb7mp8WTulvzeeBXNzg2tiNRxVxpQH3uzsV
         ozMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QGj5l9iQhhg5cy9N/m7ehbKh06pwXhVp7Me6qkFgHbc=;
        b=tVEkCFP8utc37ZWYafL8ZsFiPt4ilLe5cot8WAJBFfoOqFgitJF6ZEP6vXncVyfECO
         VJ6BSr6qm/MtijEBz9npotsFDxMG/9S9i0IcKrcPgRue+vs7aRs56LNFdCVJBZahXJA2
         PCq0RIQ9RL+6b9jPaKyGQEQDWrSIeZ9slRRcCAh13Cs//c3K4aO7BgQ/YXvzKVDM6JOW
         s5qr4DEVMtIx87EftDNmvHnv+ANOnv7kWlIEZITqIvlyPv4tszML0UmadiHPDLKfRxQ6
         sqvZs2faDjdFb6S4FB8hxN5QeWekX27SRZ+EykieEzJlBTvHKRPFeb2ZBCmgaPwUozEg
         b+Bg==
X-Gm-Message-State: ALQs6tDaCEsiEydcyPOPLiWAxkWykFVD9xG2CInCIiH7M3BSPmsWAloA
        qnGz5hkUgRjQ4BPShMtQD8MF3g==
X-Google-Smtp-Source: AIpwx49zpzi90TdNQZdh6uTnAvH1MQZneLBRZhMosglfhSJ5afnIpQmNtMbFUGNrjYL9rGW46bcg2A==
X-Received: by 10.80.135.14 with SMTP id i14mr36243068edb.86.1524676649801;
        Wed, 25 Apr 2018 10:17:29 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p36sm12277957eda.43.2018.04.25.10.17.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 10:17:28 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [PATCH bpf-next v4 00/10] bpf: document eBPF helpers and add a script to generate man page
Date:   Wed, 25 Apr 2018 18:16:51 +0100
Message-Id: <20180425171701.11048-1-quentin.monnet@netronome.com>
X-Mailer: git-send-email 2.14.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

eBPF helper functions can be called from within eBPF programs to perform
a variety of tasks that would be otherwise hard or impossible to do with
eBPF itself. There is a growing number of such helper functions in the
kernel, but documentation is scarce. The main user space header file
does contain a short commented description of most helpers, but it is
somewhat outdated and not complete. It is more a "cheat sheet" than a
real documentation accessible to new eBPF developers.

This commit attempts to improve the situation by replacing the existing
overview for the helpers with a more developed description. Furthermore,
a Python script is added to generate a manual page for eBPF helpers. The
workflow is the following, and requires the rst2man utility:

    $ ./scripts/bpf_helpers_doc.py \
            --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
    $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
    $ man /tmp/bpf-helpers.7

The objective is to keep all documentation related to the helpers in a
single place, and to be able to generate from here a manual page that
could be packaged in the man-pages repository and shipped with most
distributions.

Additionally, parsing the prototypes of the helper functions could
hopefully be reused, with a different Printer object, to generate
header files needed in some eBPF-related projects.

Regarding the description of each helper, it comprises several items:

- The function prototype.
- A description of the function and of its arguments (except for a
  couple of cases, when there are no arguments and the return value
  makes the function usage really obvious).
- A description of return values (if not void).

Additional items such as the list of compatible eBPF program and map
types for each helper, Linux kernel version that introduced the helper,
GPL-only restriction, and commit hash could be added in the future, but
it was decided on the mailing list to leave them aside for now.

For several helpers, descriptions are inspired (at times, nearly copied)
from the commit logs introducing them in the kernel--Many thanks to
their respective authors! Some sentences were also adapted from comments
from the reviews, thanks to the reviewers as well. Descriptions were
completed as much as possible, the objective being to have something easily
accessible even for people just starting with eBPF. There is probably a bit
more work to do in this direction for some helpers.

Some RST formatting is used in the descriptions (not in function
prototypes, to keep them readable, but the Python script provided in
order to generate the RST for the manual page does add formatting to
prototypes, to produce something pretty) to get "bold" and "italics" in
manual pages. Hopefully, the descriptions in bpf.h file remains
perfectly readable. Note that the few trailing white spaces are
intentional, removing them would break paragraphs for rst2man.

The descriptions should ideally be updated each time someone adds a new
helper, or updates the behaviour (new socket option supported, ...) or
the interface (new flags available, ...) of existing ones.

To ease the review process, the documentation has been split into several
patches.

v3 -> v4:
- Add a patch (#9) for newly added BPF helpers.
- Add a patch (#10) to update UAPI bpf.h version under tools/.
- Use SPDX tag in Python script.
- Several fixes on man page header and footer, and helpers documentation.
  Please refer to individual patches for details.

RFC v2 -> PATCH v3:
Several fixes on man page header and footer, and helpers documentation.
Please refer to individual patches for details.

RFC v1 -> RFC v2:
- Remove "For" (compatible program and map types), "Since" (minimal
  Linux kernel version required), "GPL only" sections and commit hashes
  for the helpers.
- Add comment on top of the description list to explain how this
  documentation is supposed to be processed.
- Update Python script accordingly (remove the same sections, and remove
  paragraphs on program types and GPL restrictions from man page
  header).
- Split series into several patches.

Cc: linux-doc@vger.kernel.org
Cc: linux-man@vger.kernel.org

Quentin Monnet (10):
  bpf: add script and prepare bpf.h for new helpers documentation
  bpf: add documentation for eBPF helpers (01-11)
  bpf: add documentation for eBPF helpers (12-22)
  bpf: add documentation for eBPF helpers (23-32)
  bpf: add documentation for eBPF helpers (33-41)
  bpf: add documentation for eBPF helpers (42-50)
  bpf: add documentation for eBPF helpers (51-57)
  bpf: add documentation for eBPF helpers (58-64)
  bpf: add documentation for eBPF helpers (65-66)
  bpf: update bpf.h uapi header for tools

 include/uapi/linux/bpf.h       | 1776 +++++++++++++++++++++++++++++++---------
 scripts/bpf_helpers_doc.py     |  421 ++++++++++
 tools/include/uapi/linux/bpf.h | 1776 +++++++++++++++++++++++++++++++---------
 3 files changed, 3181 insertions(+), 792 deletions(-)
 create mode 100755 scripts/bpf_helpers_doc.py

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
