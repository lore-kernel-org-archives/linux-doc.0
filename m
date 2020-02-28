Return-Path: <SRS0=2giX=4Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97918C3F2C6
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6293B246B3
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582848432;
	bh=xvP324uAy+ijLtQiXUCdDiym03H5jljRtuJFRC/ek4U=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=H/OqJIm/O6J5HjvQvH0XoP/CZb2fqv7gzn3P/M3YYYu1lPI/92KQzAWfXZcDP8OiP
	 ad4uX5WjPQNpvHjwW3dYVgGpeWqhjKqGM74Vj2TaKn3wm3bvRsvV0S0xgpjXqNGx1K
	 9+jsDGtz1czZxyoRfHvIh7Vu0vsL/lHGFPPjd/CM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729959AbgB1AHM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:07:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:60198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729930AbgB1AHL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:11 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA20621556;
        Fri, 28 Feb 2020 00:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848431;
        bh=xvP324uAy+ijLtQiXUCdDiym03H5jljRtuJFRC/ek4U=;
        h=From:To:Cc:Subject:Date:From;
        b=OQvSCa+7h82sHQgs42+4thsQL5m2zZ/GhIbKK/NT2VWdRiapC3W60Fv7rhnNyiSTC
         soCOe/xVgEekW5Ey5P0IIEvcZWEFM9xWiAls6VGa9XdfsG6g5P2m1n0hQblmtc42dv
         YKBBUyHPwQ1SPdJfHmJLnTsA68HMny7wsEg3TbmI=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 0/5] doc: cgroup: improve formatting
Date:   Thu, 27 Feb 2020 16:06:48 -0800
Message-Id: <20200228000653.1572553-1-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A few small changes to the cgroup-v2 doc to improve
it's rendering.

Jakub Kicinski (5):
  doc: cgroup: improve formatting
  doc: cgroup: improve formatting of mem stats
  doc: cgroup: improve formatting of io example
  doc: cgroup: improve formatting of cpuset examples
  doc: cgroup: improve formatting of references

 Documentation/accounting/psi.rst              |  2 ++
 Documentation/admin-guide/cgroup-v1/index.rst |  2 ++
 Documentation/admin-guide/cgroup-v2.rst       | 28 ++++++-------------
 3 files changed, 12 insertions(+), 20 deletions(-)

-- 
2.24.1

