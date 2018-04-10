Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4F7577E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754164AbeDJOmT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:42:19 -0400
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37771 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753370AbeDJOmR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 10:42:17 -0400
Received: by mail-wm0-f53.google.com with SMTP id r131so23849425wmb.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=HmoU1gFp6oJTpnTNQ/E8ez6cVWuL5Qmu3favcc4kP6g=;
        b=h2vGPmdD/Udp4rJjr3/636p/rfMJqzPdGSWnJxcj8hhyIXnMbsx/SP0eQAR/q0TwQd
         AWPJAPOD0gEfwg9tApl5m2oU378DPDK1zTct8nV3TDpgmHBxN3K0HWxUsX1PpdpMD4B9
         42+QZ1CHn0+4M/uEsFS2GA6v9FCCp5iXnpl2AvWdgKIYvo7Qf6MOVeiILQB9U0KxpS/p
         5PNq5KiaKHaA0P1cBLdpdx5fZwB3/5wR3qQr6Rdr5tVYw3f2d3aZ/OJrVmJd8rfhD3pr
         13Qntu24DbCoZyQnGcFmsWg3yRfzwbZgUh/LakRsWbRRUSpc+A0JLwGFWg4D8s4ggUkG
         XWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HmoU1gFp6oJTpnTNQ/E8ez6cVWuL5Qmu3favcc4kP6g=;
        b=piAh0/uIxHPC5dVzDAn1QQ2QDYNupcnWmY9B4Zf9ZmxVjIcEEJ4GV8z0nM+D64np8O
         SyVrEc7Ssevxi5+eQyioGb+8q72gJ2YPjzMs7s+huPEvXbQtN7F8zInnefCMvmz6OBZG
         ja7VUOGlHFEyOxMFO8oVgX1dj/P25qv4RqS0/ma/Zaik0r2gij3XPjxlQplYpLQ2j8eR
         vmN/RK8mM/rRItkzhCBdo6koZyHhY9WCU2mGPCqCuKsuC4T4rF4KoxJDIrr+EjPyU5FE
         kbLdkkVmZ4YoLQ6K1mtbPScDRtu+xust8kV4WsCP6e/ynBQWxdWjHZgm+HZKY4FUc8bA
         KUbg==
X-Gm-Message-State: ALQs6tBN6EnZmTnzowJzFIFT1663K+U9FnXc0RQrbcmkUZ3yU2NO41Go
        HFmXgaNsRXnUKGtpOgd56u/p5A==
X-Google-Smtp-Source: AIpwx49JIbivG8kxsZs2yL7neIRky7N2X/HSIZ02z7+i1irD/A78ehqrusiputnlmT17O0v9nN4UNQ==
X-Received: by 10.80.158.169 with SMTP id a38mr3835703edf.78.1523371336621;
        Tue, 10 Apr 2018 07:42:16 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i17sm1948907ede.13.2018.04.10.07.42.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 07:42:15 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [RFC bpf-next v2 0/8] bpf: document eBPF helpers and add a script to generate man page
Date:   Tue, 10 Apr 2018 15:41:49 +0100
Message-Id: <20180410144157.4831-1-quentin.monnet@netronome.com>
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

The second RFC for this set splits the documentation into several patches.
Ideally all helper descriptions should be reviewed by the respective
authors of the functions they describe. Please do not hesitate to suggest
improvements to make descriptions more complete or accessible.

v2:
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
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Quentin Monnet (8):
  bpf: add script and prepare bpf.h for new helpers documentation
  bpf: add documentation for eBPF helpers (01-11)
  bpf: add documentation for eBPF helpers (12-22)
  bpf: add documentation for eBPF helpers (23-32)
  bpf: add documentation for eBPF helpers (33-41)
  bpf: add documentation for eBPF helpers (42-50)
  bpf: add documentation for eBPF helpers (51-57)
  bpf: add documentation for eBPF helpers (58-64)

 include/uapi/linux/bpf.h   | 1580 +++++++++++++++++++++++++++++++++-----------
 scripts/bpf_helpers_doc.py |  414 ++++++++++++
 2 files changed, 1616 insertions(+), 378 deletions(-)
 create mode 100755 scripts/bpf_helpers_doc.py

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
