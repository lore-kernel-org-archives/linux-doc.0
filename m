Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 373977D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 13:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfDPN25 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 09:28:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60676 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbfDPN25 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Apr 2019 09:28:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 89EA5368E3;
        Tue, 16 Apr 2019 13:28:57 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C975B608A4;
        Tue, 16 Apr 2019 13:28:52 +0000 (UTC)
Date:   Tue, 16 Apr 2019 09:28:52 -0400
From:   Mike Snitzer <snitzer@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alasdair Kergon <agk@redhat.com>, dm-devel@redhat.com
Subject: Re: [PATCH 10/57] docs: device-mapper: convert it to ReST format
Message-ID: <20190416132851.GA22497@redhat.com>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
 <9dd3c4eca01489bd67ea6de88dfedef8b0e81901.1555382110.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dd3c4eca01489bd67ea6de88dfedef8b0e81901.1555382110.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 16 Apr 2019 13:28:57 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 15 2019 at 10:55pm -0400,
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Convert the Device Mapper documentation to ReST.

Can you help me understand why this is the direction text based
Documenation is taking in the Linux kernel?  All I see is markup, and
escaping of characters, that is a chore to administer over time.

Please advise, thanks.
Mike
