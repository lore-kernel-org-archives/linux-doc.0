Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 996907D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 18:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbeJYDL5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Oct 2018 23:11:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41912 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbeJYDL5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Oct 2018 23:11:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id 23-v6so2734194pgc.8
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/U4+m+OeE3flLI2yNYra9HeU2jvsiQRhY1j4EXA26iM=;
        b=OBR1hC5TLFNo6Uc+SRzBRZp/eE2fDPYTh6lVxnB3UBc2zBQ4+JvG0UZ5RU65WXqrtk
         gtiiITTIesBYVMSVpS3+V/Iy8GcrhFgE5djJBrdQKo/ZBGdeIvPiFoatQhug4jpja3MX
         CqWLKbakcJ7gm2xfdI2cH5i8sJkPuvdBhwT8A8GSHB9TsOsoB8s/A6qEejezDNsQNM5b
         XOt3MfjAgAUZQpeR7BpupFPKJAK7AXNSQyYVnNQte3kpNxJB5nX4XAlCw5YyzJPtEyoB
         uqv7VpN+z6NZlI4VYUTJhFag1KpZ86GYFpCtSHvgNmAlbXP20ypXWWZqpPiVFUah/N7m
         jamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/U4+m+OeE3flLI2yNYra9HeU2jvsiQRhY1j4EXA26iM=;
        b=rbV9KVmULJ0GtwsTUHFsyOYGLth4+99qjYexPPwRO6IQX0uX5R10YNkgvB2yqnXj+r
         Ocr3WFZkXIG/nGW20hXpHRJ7erk3u1AjxoinI9U4LUzbsL3aTocNDPznRG2VkBd/1FW2
         OnDSCEAnhUlomklJWBmPJF+gRj8peZgyWuQhOoDxeWc2IKUSdOomkB8Df4LUaEOdJynU
         /AXwRR74hOgDAli6ZfS7NyRq0PgtZadzFQFSyxBUPz7Hs4505e/gMrV2rkaaLG54afhq
         BUaFjlsH/LGeGnMO37Etm5saxok3ZD7Yxntxipp9dkhtyKEbl3hiwJZQHW60vcudsNTu
         kfyg==
X-Gm-Message-State: AGRZ1gLObH+SkBRnt4gxa3uDCYc8zrSTEx9iqQYFwFBhb9s5gRZA9Ty3
        vS9q19wgcQIplYf48Dfs5CsYjQ==
X-Google-Smtp-Source: AJdET5e9gxChizjzAhW0fIGlGj0b9m06UtJYJrDkwDcrR021rmG1bzPRRlk/aHEOfZArm7C47R9UvA==
X-Received: by 2002:a63:413:: with SMTP id 19mr3547830pge.7.1540406565951;
        Wed, 24 Oct 2018 11:42:45 -0700 (PDT)
Received: from paullawrence.mtv.corp.google.com ([2620:0:1000:1601:da51:dc8c:708a:5253])
        by smtp.gmail.com with ESMTPSA id m27-v6sm17114991pff.187.2018.10.24.11.42.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Oct 2018 11:42:45 -0700 (PDT)
Subject: Re: [RFC] dm-bow working prototype
To:     Alasdair Kergon <agk@redhat.com>
References: <20181023212358.60292-1-paullawrence@google.com>
 <20181023221819.GB17552@agk-dp.fab.redhat.com>
Cc:     Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Jonathan Corbet <corbet@lwn.net>, Shaohua Li <shli@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-raid@vger.kernel.org, kernel-team@android.com
From:   Paul Lawrence <paullawrence@google.com>
Message-ID: <296148c2-f2d9-5818-ea76-d71a0d6f5cd4@google.com>
Date:   Wed, 24 Oct 2018 11:42:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181023221819.GB17552@agk-dp.fab.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Android has had the concept of A/B updates for since Android N, which 
means that if an update is unable to boot for any reason three times, we 
revert to the older system. However, if the failure occurs after the new 
system has started modifying userdata, we will be attempting to start an 
older system with a newer userdata, which is an unsupported state. Thus 
to make A/B able to fully deliver on its promise of safe updates, we 
need to be able to revert userdata in the event of a failure.

For those cases where the file system on userdata supports 
snapshots/checkpoints, we should clearly use them. However, there are 
many Android devices using filesystems that do not support checkpoints, 
so we need a generic solution. Here we had two options. One was to use 
overlayfs to manage the changes, then on merge have a script that copies 
the files to the underlying fs. This was rejected on the grounds of 
compatibility concerns and managing the merge through reboots, though it 
is definitely a plausible strategy. The second was to work at the block 
layer.

At the block layer, dm-snap would have given us a ready-made solution, 
except that there is no sufficiently large spare partition on Android 
devices. But in general there is free space on userdata, just scattered 
over the device, and of course likely to get modified as soon as 
userdata is written to. We also decided that the merge phase was a high 
risk component of any design. Since the normal path is that the update 
succeeds, we anticipate merges happening 99% of the time, and we want to 
guarantee their success even in the event of unexpected failure during 
the merge. Thus we decided we preferred a strategy where the device is 
in the committed state at all times, and rollback requires work, to one 
where the device remains in the original state but the merge is complex.


On 10/23/2018 03:18 PM, Alasdair G Kergon wrote:
> On Tue, Oct 23, 2018 at 02:23:28PM -0700, Paul Lawrence wrote:
>> It is planned to use this driver to enable restoration of a failed
>> update attempt on Android devices using ext4.
> Could you say a bit more about the reason for this new dm target so we
> can understand better what parameters you are trying to optimise and
> within what new constraints?  What are the failure modes that you need
> to handle better by using this?  (We can guess some answers, but it
> would better if you can lay them out so we don't need to make
> assumptions.)
>
> Alasdair
>

