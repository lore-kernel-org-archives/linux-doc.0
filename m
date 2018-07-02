Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6462B7D062
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Jul 2018 17:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752646AbeGBR11 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 13:27:27 -0400
Received: from ms.lwn.net ([45.79.88.28]:47888 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752554AbeGBR10 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Jul 2018 13:27:26 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 937E59B6;
        Mon,  2 Jul 2018 17:27:24 +0000 (UTC)
Date:   Mon, 2 Jul 2018 11:27:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-kernel@zh-kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-leds@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        James Morris <james.morris@microsoft.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Changbin Du <changbin.du@intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-scsi@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH 0/9] Fix references for some missing documentation files
Message-ID: <20180702112723.654d348c@lwn.net>
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 26 Jun 2018 06:49:02 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Having nothing to do while waiting for my plane to arrive while
> returning back from Japan, I ended by writing a small series of 
> patches meant to reduce the number of bad Documentation/* 
> links that are detected by:
> 	./scripts/documentation-file-ref-check

I've applied everything except the two networking patches, since I expect
those to go through Dave's tree.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
