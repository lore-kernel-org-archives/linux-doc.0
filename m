Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE7477D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 21:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfE2Vsi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 17:48:38 -0400
Received: from ms.lwn.net ([45.79.88.28]:43728 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfE2Vsi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 29 May 2019 17:48:38 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D226A2B4;
        Wed, 29 May 2019 21:48:37 +0000 (UTC)
Date:   Wed, 29 May 2019 15:48:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: cdomain.py: get rid of a warning since version
 1.8
Message-ID: <20190529154837.6d6a0f69@lwn.net>
In-Reply-To: <b38a9fdfdcda49b2c6118072afac564e96406800.1558608217.git.mchehab+samsung@kernel.org>
References: <b38a9fdfdcda49b2c6118072afac564e96406800.1558608217.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 May 2019 07:43:43 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> There's a new warning about a deprecation function. Add a
> logic at cdomain.py to avoid that.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Applied, thanks.

jon
