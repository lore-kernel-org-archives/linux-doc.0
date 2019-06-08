Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4643E7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Sat,  8 Jun 2019 19:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfFHToJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 8 Jun 2019 15:44:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:36348 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727215AbfFHToJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 8 Jun 2019 15:44:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BEB8E2CD;
        Sat,  8 Jun 2019 19:44:08 +0000 (UTC)
Date:   Sat, 8 Jun 2019 13:44:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 00/22] Some documentation fixes
Message-ID: <20190608134407.580f8bb5@lwn.net>
In-Reply-To: <20190607154430.4879976d@coco.lan>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
        <20190607115521.6bf39030@lwn.net>
        <20190607154430.4879976d@coco.lan>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 7 Jun 2019 15:44:30 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> After doing that, there are 17 patches yet to be applied. Two new
> patches are now needed too, due to vfs.txt -> vfs.rst and
> pci.txt -> pci.rst renames.

OK, I've applied the set, minus those that had been picked up elsewhere.

Thanks,

jon
