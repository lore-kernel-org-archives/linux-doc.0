Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 825857D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 08:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbeIEMmU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 08:42:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:51220 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727527AbeIEMmU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Sep 2018 08:42:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F3F93AE9E;
        Wed,  5 Sep 2018 08:13:16 +0000 (UTC)
Date:   Wed, 5 Sep 2018 10:13:16 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Harry Cutts <hcutts@chromium.org>
cc:     linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 0/5] Add support for high-resolution scrolling on
 Logitech mice
In-Reply-To: <20180830215622.47550-1-hcutts@chromium.org>
Message-ID: <nycvar.YFH.7.76.1809051013000.15880@cbobk.fhfr.pm>
References: <20180830215622.47550-1-hcutts@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 Aug 2018, Harry Cutts wrote:

> This is v2 of the patch set adding support for high-resolution scroll 
> wheels on Logitech mice. See the linux-input "Reporting high-resolution 
> scroll events" thread [0] for previous discussion of the evdev changes. 
> I would love to hear your feedback.

Queued in for-4.20/logitech-highres. Thanks,

-- 
Jiri Kosina
SUSE Labs

