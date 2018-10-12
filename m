Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 812397D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 17:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbeJMBEP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 21:04:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:51164 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbeJMBEP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Oct 2018 21:04:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0FABC2E5;
        Fri, 12 Oct 2018 17:30:42 +0000 (UTC)
Date:   Fri, 12 Oct 2018 11:30:40 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wesley Sheng <wesleyshenggit@sina.com>
Cc:     kurt.schwemmer@microsemi.com, logang@deltatee.com,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhelgaas@google.com,
        linux-ntb@googlegroups.com,
        Wesley Yung <wesley.yung@microchip.com>,
        Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v3] NTB: switchtec_ntb: Update switchtec documentation
 with pre-requisites for NTB
Message-ID: <20181012113040.52bfff58@lwn.net>
In-Reply-To: <1539174788-25878-1-git-send-email-wesleyshenggit@sina.com>
References: <1539174788-25878-1-git-send-email-wesleyshenggit@sina.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 Oct 2018 20:33:08 +0800
Wesley Sheng <wesleyshenggit@sina.com> wrote:

> The ntb_hw_switchtec driver has requirements on kernel configuration
> so we add these notes to the documentation and also clean up a few 
> other sentences in the documentation.
> 
> Signed-off-by: Wesley Yung <wesley.yung@microchip.com>
> Signed-off-by: Kelvin Cao <kelvin.cao@microchip.com>
> Signed-off-by: Wesley Sheng <wesleyshenggit@sina.com>

So why all of these signoffs for such a small patch?  Who is the actual
author of the patch?

Thanks,

jon
