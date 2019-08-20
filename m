Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC1EB7D91B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Aug 2019 14:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730565AbfHTO6y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Aug 2019 10:58:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49006 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730554AbfHTO6x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Aug 2019 10:58:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 955B110576D8;
        Tue, 20 Aug 2019 14:58:53 +0000 (UTC)
Received: from treble (ovpn-120-159.rdu2.redhat.com [10.10.120.159])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C87917F23;
        Tue, 20 Aug 2019 14:58:52 +0000 (UTC)
Date:   Tue, 20 Aug 2019 09:58:50 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        security@kernel.org, linux-doc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Kosina <jkosina@suse.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Laura Abbott <labbott@redhat.com>,
        Ben Hutchings <ben@decadent.org.uk>,
        Tyler Hicks <tyhicks@canonical.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH v2] Documentation/admin-guide: Embargoed hardware
 security issues
Message-ID: <20190820145850.x445rw4uoqz6n4hw@treble>
References: <20190725130113.GA12932@kroah.com>
 <20190815212505.GC12041@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190815212505.GC12041@kroah.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 20 Aug 2019 14:58:53 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 15, 2019 at 11:25:05PM +0200, Greg Kroah-Hartman wrote:
> +Contact
> +-------
> +
> +The Linux kernel hardware security team is separate from the regular Linux
> +kernel security team.
> +
> +The team only handles the coordination of embargoed hardware security
> +issues.  Reports of pure software security bugs in the Linux kernel are not
> +handled by this team and the reporter will be guided to contact the regular
> +Linux kernel security team (:ref:`Documentation/admin-guide/
> +<securitybugs>`) instead.
> +
> +The team can be contacted by email at <hardware-security@kernel.org>. This
> +is a private list of security officers who will help you to coordinate an
> +issue according to our documented process.
> +
> +The list is encrypted and email to the list can be sent by either PGP or
> +S/MIME encrypted and must be signed with the reporter's PGP key or S/MIME
> +certificate. The list's PGP key and S/MIME certificate are available from
> +https://www.kernel.org/....

This link needs to be filled in?

> +Encrypted mailing-lists
> +-----------------------
> +
> +We use encrypted mailing-lists for communication. The operating principle
> +of these lists is that email sent to the list is encrypted either with the
> +list's PGP key or with the list's S/MIME certificate. The mailing-list
> +software decrypts the email and re-encrypts it individually for each
> +subscriber with the subscriber's PGP key or S/MIME certificate. Details
> +about the mailing-list software and the setup which is used to ensure the
> +security of the lists and protection of the data can be found here:
> +https://www.kernel.org/....

Ditto?

-- 
Josh
