Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 931087E677
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 09:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751541AbeCOJm6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 05:42:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60718 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751480AbeCOJmz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 05:42:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 27B3A20CC6;
        Thu, 15 Mar 2018 09:42:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-100.rdu2.redhat.com [10.10.120.100])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 23DB91208F74;
        Thu, 15 Mar 2018 09:42:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20180314143529.1456168-1-arnd@arndb.de>
References: <20180314143529.1456168-1-arnd@arndb.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     dhowells@redhat.com, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 00/16] remove eight obsolete architectures
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2928.1521106970.1@warthog.procyon.org.uk>
Date:   Thu, 15 Mar 2018 09:42:50 +0000
Message-ID: <2929.1521106970@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 15 Mar 2018 09:42:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 15 Mar 2018 09:42:54 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'dhowells@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Do we have anything left that still implements NOMMU?

David
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
