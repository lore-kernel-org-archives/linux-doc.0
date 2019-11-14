Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8F397D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 13:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfKNNW6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 08:22:58 -0500
Received: from ms.lwn.net ([45.79.88.28]:36478 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726613AbfKNNW6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Nov 2019 08:22:58 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 655547C0;
        Thu, 14 Nov 2019 13:22:57 +0000 (UTC)
Date:   Thu, 14 Nov 2019 06:22:55 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
Message-ID: <20191114062255.4f4ffc2f@lwn.net>
In-Reply-To: <25c9ec73-64d3-a5dc-2f64-863c04dad22d@darmarit.de>
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
        <87a79141s3.fsf@intel.com>
        <20191112084257.4cca2d4c@lwn.net>
        <871rud3x2e.fsf@intel.com>
        <25c9ec73-64d3-a5dc-2f64-863c04dad22d@darmarit.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Nov 2019 10:37:21 +0100
Markus Heiser <markus.heiser@darmarit.de> wrote:

> I have a doubt that translating has to be a part of the kernel development.
> 
> Minimal English is one of the prerequisites to be a part of the community.
> Maintainers do not master foreign languages, they are forced to commit
> blindly without quality assurance.  APIs will never be translated and
> the translation of articles is at random.

We've had this particular discussion before.  My own feeling is that
translated documentation can make an easier entry point for developers
who did not grow up speaking English; that, in turn, makes our community
just a little bit more inclusive.  We certainly can't *require* any sort
of translation work, but I'm happy to encourage it where the interest
exists.

Thanks,

jon
