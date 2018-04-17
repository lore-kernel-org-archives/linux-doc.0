Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 627527E8A1
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 14:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753938AbeDQOfW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 10:35:22 -0400
Received: from mail-wr0-f170.google.com ([209.85.128.170]:44615 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752812AbeDQOfU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 10:35:20 -0400
Received: by mail-wr0-f170.google.com with SMTP id o15so5189857wro.11
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=22/5DbQAVO34kUtN3RRKBsHPkcToFT5OrKaPnQcpz7k=;
        b=ZNd8CQw4Bn11uJKr/PJlpDaNiaik6sJNZwS3mZDmsIzXnOJq6TFi1yt2xsVmZgEEoi
         PuHE3rudXmhDqjjWGLPR2AB+9c2ZlaEaF1PJC4gwloOTMjt9kRrTO5wV9Fvn/EAjjbeN
         uR+82ML/hDC/9AQBm/DxGmyIXleCEwpEQnCA4TMLjpGd5AQ4PLhD0TlVlZvwCuE0bKqW
         GPfq9ilPRVtHjI9yC77wz8I+zrm0//WvwQurRLJWkpnwB0wQuvBSeotKhyKPqSIsLVft
         JtYb9Trupk7kxIZRbDquj/MwUpS2BeJW60WES5UA8PGsgZcIPzAs+BOc396uT4JBuqCn
         4qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=22/5DbQAVO34kUtN3RRKBsHPkcToFT5OrKaPnQcpz7k=;
        b=iyNOGCOC/9YGm1GOsypGUVoYlQxi8jJRKv5ileGbrM2haDW4qYyLQkIMNqUBXAniyq
         M0ztBFewDqNShMoTiwGqqofjvHkSd+LD8TPYqpjYpyiM5b5Gdb3kO6H0Z1Qqsj2ZNToi
         hXSaL8lofmOgN6lKqpLzZaYwdwuifgRFm40YEOs0QJNpSY6zS8K6XtEryiV1eN8Wvliv
         qI8EpKOf7CXzaVNzEYLcsXIezdOYpft1mO3sz1HoIexRE42QGa7yl7a1FLt2xyp8NyxL
         iZKLgA4QyCKhgpjO9phJjdJ/GJkJuDyiMj32K7X41NEeJ4X1ylEMr68D+cMRQJAZpNYA
         HsvA==
X-Gm-Message-State: ALQs6tCfCVK3fgH3K3C2XfE7cwGEuMFKsPbF6sFAdTY3gdZ/zk2f+/2B
        33OHrDmrxq0tpiytyQR7URlLISlZ
X-Google-Smtp-Source: AIpwx48gelSo1okvqKmAE0tJxxEHSM8aYfMB28R7MT1DYzWHkeGlB6h/atOvP4418VCuZLvuwwBGtg==
X-Received: by 10.80.204.8 with SMTP id m8mr3425018edi.116.1523975718877;
        Tue, 17 Apr 2018 07:35:18 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id o16sm9340240edc.33.2018.04.17.07.35.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Apr 2018 07:35:17 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [PATCH bpf-next v3 0/8] bpf: document eBPF helpers and add a script to generate man page
Date:   Tue, 17 Apr 2018 15:34:30 +0100
Message-Id: <20180417143438.7018-1-quentin.monnet@netronome.com>
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
their respective authors! They were completed as much as possible, the
objective being to have something easily accessible even for people just
starting with eBPF. There is probably a bit more work to do in this
direction for some helpers.

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

Quentin Monnet (8):
  bpf: add script and prepare bpf.h for new helpers documentation
  bpf: add documentation for eBPF helpers (01-11)
  bpf: add documentation for eBPF helpers (12-22)
  bpf: add documentation for eBPF helpers (23-32)
  bpf: add documentation for eBPF helpers (33-41)
  bpf: add documentation for eBPF helpers (42-50)
  bpf: add documentation for eBPF helpers (51-57)
  bpf: add documentation for eBPF helpers (58-64)

 include/uapi/linux/bpf.h   | 1604 +++++++++++++++++++++++++++++++++-----------
 scripts/bpf_helpers_doc.py |  434 ++++++++++++
 2 files changed, 1658 insertions(+), 380 deletions(-)
 create mode 100755 scripts/bpf_helpers_doc.py

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
