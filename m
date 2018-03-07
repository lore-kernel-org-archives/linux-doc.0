Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C99A7E667
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 14:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754491AbeCGOq2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 09:46:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:49458 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754388AbeCGOq2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Mar 2018 09:46:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8D2C3AD48;
        Wed,  7 Mar 2018 14:46:26 +0000 (UTC)
Date:   Wed, 7 Mar 2018 15:46:25 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aishwarya Pant <aishpant@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] HID: ntrig: document sysfs interface
In-Reply-To: <20180302053017.GA23123@mordor.localdomain>
Message-ID: <nycvar.YFH.7.76.1803071546100.15778@cbobk.fhfr.pm>
References: <20180302053017.GA23123@mordor.localdomain>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Mar 2018, Aishwarya Pant wrote:

> Add sysfs documentation for N-Trig touchscreens under Documentation/ABI.
> Descriptions have been collected from code comments.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
