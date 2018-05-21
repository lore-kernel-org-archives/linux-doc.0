Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8BCA7D0DC
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 12:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751019AbeEUM2k (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 08:28:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59672 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750923AbeEUM2j (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 08:28:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E5C8DCB9C1;
        Mon, 21 May 2018 12:28:38 +0000 (UTC)
Received: from asgard.redhat.com (ovpn-200-31.brq.redhat.com [10.40.200.31])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7482017D1F;
        Mon, 21 May 2018 12:28:36 +0000 (UTC)
Date:   Mon, 21 May 2018 14:29:30 +0200
From:   Eugene Syromiatnikov <esyr@redhat.com>
To:     netdev@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: [PATCH 0/3] bpf: add boot parameters for sysctl knobs
Message-ID: <20180521122923.GA15717@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 21 May 2018 12:28:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 21 May 2018 12:28:38 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'esyr@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello.

This patch set adds ability to set default values for
kernel.unprivileged_bpf_disable, net.core.bpf_jit_harden,
net.core.bpf_jit_kallsyms sysctl knobs as well as option to override
them via a boot-time kernel parameter.

Eugene Syromiatnikov (3):
  bpf: add ability to configure unprivileged BPF via boot-time parameter
  bpf: add ability to configure BPF JIT hardening via boot-time
    parameter
  bpf: add ability to configure BPF JIT kallsyms export at the boot time

 Documentation/admin-guide/kernel-parameters.txt | 28 ++++++++
 init/Kconfig                                    | 90 +++++++++++++++++++++++++
 kernel/bpf/core.c                               | 31 +++++++++
 kernel/bpf/syscall.c                            | 16 +++++
 4 files changed, 165 insertions(+)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
