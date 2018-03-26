Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5BF517DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 14:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752165AbeCZOlv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 10:41:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:54534 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751677AbeCZOlv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Mar 2018 10:41:51 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DA2802F5;
        Mon, 26 Mar 2018 14:41:50 +0000 (UTC)
Date:   Mon, 26 Mar 2018 08:41:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: admin-guide: add kvmconfig, xenconfig
 and tinyconfig commands
Message-ID: <20180326084149.36075691@lwn.net>
In-Reply-To: <20180322120656.13644-1-martink@posteo.de>
References: <20180322120656.13644-1-martink@posteo.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Mar 2018 13:06:56 +0100
Martin Kepplinger <martink@posteo.de> wrote:

> Add kvmconfig, xenconfig and tinyconfig to the list of alternative
> configuration commands. Descriptions are directly taken from the Makefile.

Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
