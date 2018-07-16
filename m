Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3DE5B7D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Jul 2018 11:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbeGPLuY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Jul 2018 07:50:24 -0400
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:60133 "EHLO
        faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726602AbeGPLuX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jul 2018 07:50:23 -0400
Received: from faui49t (faui49t.informatik.uni-erlangen.de [131.188.42.17])
        by faui40.informatik.uni-erlangen.de (Postfix) with SMTP id 2959258C4F2;
        Mon, 16 Jul 2018 13:23:21 +0200 (CEST)
Received: by faui49t (sSMTP sendmail emulation); Mon, 16 Jul 2018 13:23:21 +0200
From:   Andreas Ziegler <andreas.ziegler@fau.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Changbin Du <changbin.du@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andreas Ziegler <andreas.ziegler@fau.de>
Subject: [PATCH 0/2] Documentation: trace: improve probe documentation
Date:   Mon, 16 Jul 2018 13:05:56 +0200
Message-Id: <1531739158-31133-1-git-send-email-andreas.ziegler@fau.de>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series improves the documentation for uprobes and
kprobes.

The filename for enabling/disabling single events is 'enable',
not 'enabled'. kprobetrace.rst lists the files present in the
per-event directories but missed 'trigger' so far.

Andreas Ziegler (2):
  Documentation: {u,k}probes: fix filename for event enabling
  Documentation: kprobetrace: document 'trigger' file

 Documentation/trace/kprobetrace.rst  | 9 ++++++---
 Documentation/trace/uprobetracer.rst | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
