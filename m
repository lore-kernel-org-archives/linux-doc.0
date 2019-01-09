Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D7C1E7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Jan 2019 14:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730994AbfAIOj1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Jan 2019 09:39:27 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38488 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731640AbfAIOj1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jan 2019 09:39:27 -0500
Received: by mail-pf1-f196.google.com with SMTP id q1so3760852pfi.5
        for <linux-doc@vger.kernel.org>; Wed, 09 Jan 2019 06:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qLWFgPGUlL4hfkQh3qWtVmtFk7lmuoGc171l0OAh9mA=;
        b=w9NHg6d0zKFuexv+kYsSm3ANBPdNxIbZ829pc2zxR9zPWoZbzdCUyZGOF4KWk+HvkP
         2s6Uz7xIUP6ZGdimwD6lCtpAhddhIzaImxdoL/XWlhwyfGfkvjHET5XzvZi9RUzNOP8W
         ldEkNvhkj7uO8Mttxzb/zitMyL74gTlPsVneNGp76Bje7f/GQS1LjMTgZ1PdakKg/64C
         UsLeKWlluM27RUHSY/ZyIyl/U5uUhGvFjivEs8bIArqfI2lqvrn1XxqqHKHtSybAbT9x
         Vpk1BDkKHvmyJGW0hWjusYvmQFzQpaufsd2hB+4WZogXNWhyHoSvZ4H2X3/EX3c0mbqK
         YnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qLWFgPGUlL4hfkQh3qWtVmtFk7lmuoGc171l0OAh9mA=;
        b=ffbJNLGHwpecetng6w63XqkEv6ZCHHVIka7g0S9/mfW1d6eM8pdnzCs9e2TuygLVbM
         PZuLsdNFxIkjwD3xd/mBZ/fLazBxjZpoJ4FFHQjN8Q/eAB7CRf4SaBFm4PpXieIxcsCN
         aD/mniSwSIgtJkvywghU4+eKmH1ql/gghUZ1zT3gxxLya3ef7GroeHTSvD+vdV7xE1Yf
         IoAHlsDwz94dBmlIc1XLZKJBKFj37tygct5dUx04Lc6T8nGwwNkluuRNnhsfhFtU3gzW
         JIpHagsU4XU1m4faZw0YO4q3R2MLQwjyt67Pv7JuXjTi1yt6mFL6plhcYPDgNC1LXs6H
         A+Kg==
X-Gm-Message-State: AJcUukdfN5OHNF5r8nOEKiBqcipESiiVbUP5XlRkGq30Zs6OE8reiasw
        SfwsNZ3aHkeWZYBYXhyd+Bqxx7e0Fnzr1g==
X-Google-Smtp-Source: ALg8bN66Bk8ILVOgAgNbYG1G3N00r9IVre5PBAf1GNBSqUCj2vI1BaL72XeRnlqg7+Tsojy+sNzMhQ==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr5571841pgc.200.1547044766386;
        Wed, 09 Jan 2019 06:39:26 -0800 (PST)
Received: from [192.168.1.121] (66.29.188.166.static.utbb.net. [66.29.188.166])
        by smtp.gmail.com with ESMTPSA id 196sm285428795pfc.77.2019.01.09.06.39.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 06:39:25 -0800 (PST)
Subject: Re: [PATCH] block: doc: add slice_idle_us to bfq documentation
To:     John Pittman <jpittman@redhat.com>, paolo.valente@linaro.org
Cc:     corbet@lwn.net, linux-block@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20190108215613.15277-1-jpittman@redhat.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <64f1bba8-1a6e-5aa0-3357-edfdcd7de574@kernel.dk>
Date:   Wed, 9 Jan 2019 07:39:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190108215613.15277-1-jpittman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/8/19 2:56 PM, John Pittman wrote:
> Of the tunables available for the bfq I/O scheduler,
> the only one missing from the documentation in
> 'Documentation/block/bfq-iosched.txt' is slice_idle_us.
> Add this tunable to the documentation and a short
> explanation of its purpose.

Applied, but I fixed up your commit message. You should use 72
chars lengths.

-- 
Jens Axboe

