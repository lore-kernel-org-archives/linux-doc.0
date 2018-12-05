Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1E457D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 12:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbeLEML5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 07:11:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:42876 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726924AbeLEML5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Dec 2018 07:11:57 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EC61DB703;
        Wed,  5 Dec 2018 12:11:55 +0000 (UTC)
Date:   Wed, 5 Dec 2018 13:11:55 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Wei Yang <richard.weiyang@gmail.com>
Cc:     david@redhat.com, osalvador@suse.de, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] admin-guide/memory-hotplug.rst: remove locking
 internal part from admin-guide
Message-ID: <20181205121155.GJ1286@dhcp22.suse.cz>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205023426.24029-1-richard.weiyang@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed 05-12-18 10:34:25, Wei Yang wrote:
> Locking Internal section exists in core-api documentation, which is more
> suitable for this.
> 
> This patch removes the duplication part here.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

Yes this doesn't really make any sense in an admin guide. It is a pure
implementation detail nobody should be relying on.
-- 
Michal Hocko
SUSE Labs
