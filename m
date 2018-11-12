Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32D9A7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 12:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbeKLWVp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 17:21:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:38100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729296AbeKLWVp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Nov 2018 17:21:45 -0500
Received: from localhost (unknown [206.108.79.134])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D742D2080D;
        Mon, 12 Nov 2018 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542025720;
        bh=kucl4q/8e40D4A8W9UZj4JJzE5Vks07LAHce70ttib4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XLBt3LBKUEQgXJ+NeiIwjfArL3fwyD/JmQwATw6Wle9KHp5KLJHS8y+LID0KzvJY2
         ZPSxJfJx7NcdIilkSznbKakrgDLf26ZXZHPHsaG8jKWDCTunuO3hU6ZoxUgKZIXE7J
         oHhG7PheQFHHqHPS9CftGwCZBaBVePndi1vsGUyM=
Date:   Mon, 12 Nov 2018 04:28:40 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paolo Valente <paolo.valente@linaro.org>
Cc:     Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Angelo Ruocco <angeloruocco90@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        broonie@kernel.org, bfq-iosched@googlegroups.com,
        oleksandr@natalenko.name, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 01/12] kernfs: add function to find kernfs_node without
 increasing ref counter
Message-ID: <20181112122840.GA1429@kroah.com>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
 <20181112095632.69114-2-paolo.valente@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181112095632.69114-2-paolo.valente@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 12, 2018 at 10:56:21AM +0100, Paolo Valente wrote:
> From: Angelo Ruocco <angeloruocco90@gmail.com>
> 
> The kernfs pseudo file system doesn't export any function to only find
> a node by name, without also getting a reference on it.
> But in some cases it is useful to just locate a kernfs node, while
> using it or not depends on some other condition.
> 
> This commit adds a function to just look for a node, without getting
> a reference on it.

Eeek, that sounds really bad.  So you save off a pointer to something,
and have no idea if that pointer now really is valid or not?  It can
instantly disappear right afterwards.

This feels wrong, what is the problem of having a properly reference
counted object passed back to you that you have to create a dangerous
function like this?

greg k-h
