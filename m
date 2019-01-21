Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7B37B7D161
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 11:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfAULRb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 06:17:31 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:59762 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbfAULRb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Jan 2019 06:17:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19434EBD;
        Mon, 21 Jan 2019 03:17:31 -0800 (PST)
Received: from queper01-lin.cambridge.arm.com (queper01-lin.cambridge.arm.com [10.1.195.48])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 046553F5C1;
        Mon, 21 Jan 2019 03:17:28 -0800 (PST)
From:   Quentin Perret <quentin.perret@arm.com>
To:     corbet@lwn.net, peterz@infradead.org, rjw@rjwysocki.net,
        juri.lelli@redhat.com
Cc:     mingo@redhat.com, morten.rasmussen@arm.com, qais.yousef@arm.com,
        patrick.bellasi@arm.com, dietmar.eggemann@arm.com,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Documentation: Explain EAS and EM
Date:   Mon, 21 Jan 2019 11:17:21 +0000
Message-Id: <20190121111724.18234-1-quentin.perret@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The recently introduced Energy Aware Scheduling (EAS) feature relies on
a large set of concepts, assumptions, and design choices that are
probably not obvious for an outsider. Moreover, enabling EAS on a
particular platform isn't straightforward because of all its
dependencies. This series tries to address this by introducing proper
documentation files for the scheduler's part of EAS and for the newly
introduced Energy Model (EM) framework. These are meant to explain not
only the design choices of EAS but also to list its dependencies in a
human-readable location.

Changes in v2:
 - Fixed typos and style in sched-energy.txt (Juri)
 - Moved EM doc under Documentation/driver-api/pm/ (Rafael)
 - Translated EM doc into .rst (Rafael)
 - Fixed EM kerneldoc comments to avoid htmldoc build errors

Quentin Perret (3):
  PM / EM: Fix broken kerneldoc
  PM / EM: Document the Energy Model framework
  sched: Document Energy Aware Scheduling

 Documentation/driver-api/pm/energy-model.rst | 150 +++++++
 Documentation/driver-api/pm/index.rst        |   1 +
 Documentation/scheduler/sched-energy.txt     | 431 +++++++++++++++++++
 include/linux/energy_model.h                 |   4 +-
 kernel/power/energy_model.c                  |   2 +-
 5 files changed, 585 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/driver-api/pm/energy-model.rst
 create mode 100644 Documentation/scheduler/sched-energy.txt

-- 
2.20.1

