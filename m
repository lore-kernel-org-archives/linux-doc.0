Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FB6E7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Dec 2018 15:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730953AbeLTPeZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Dec 2018 10:34:25 -0500
Received: from ms.lwn.net ([45.79.88.28]:53478 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730667AbeLTPeZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Dec 2018 10:34:25 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D483E182;
        Thu, 20 Dec 2018 15:34:24 +0000 (UTC)
Date:   Thu, 20 Dec 2018 08:34:23 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs/mm-api: link kernel-doc comments from
 slab_common.c
Message-ID: <20181220083423.40233348@lwn.net>
In-Reply-To: <20181220075912.GA12338@rapoport-lnx>
References: <1544130781-13443-1-git-send-email-rppt@linux.ibm.com>
        <20181220075912.GA12338@rapoport-lnx>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 20 Dec 2018 09:59:13 +0200
Mike Rapoport <rppt@linux.ibm.com> wrote:

> ping?

Sorry, been traveling, and I still don't really know what to do with
patches that are more mm/ than Documentation/.  I've just applied these,
though.

Thanks,

jon
