Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 436DE7D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Oct 2018 12:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbeJJTkq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Oct 2018 15:40:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41106 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbeJJTkq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Oct 2018 15:40:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id l197-v6so3887511oib.8
        for <linux-doc@vger.kernel.org>; Wed, 10 Oct 2018 05:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKr0bU93kfyBn9k7agQNYGBUDivVOo0AZ99O7iHxBGY=;
        b=GQAsgPdBKYtO4rMNMewl/4bEUX6qnLcfm5Jd0ZJJZ+zuiE9ZQG3m0OD/ZpyRX5zpKo
         pYTMslGezSP5L0cIBelzqY2oTYGN6uWVXQhKv+Uq18872qE0Vw+XprpHVu6wpFASG5AF
         xXJT18zTMbS8p0V7bjXOsXMjV8b2wgAYHwr8lJgecrO9jmTy0N9yEkeZvX2NVD+4KZ6t
         EaRdUOfElt5JHo1HdHM5Ab0LH4QbfbEMcvfmM0GH6oX6GgyZRwi/zlJnmxUxHYeh5ZHi
         PoLbkzc8SR9OcfXZ4VcYVGhSWFdg1aBSQhpkx8FIGCrdt2mGubHpeCKN0cCT4WVTWyZD
         bu1w==
X-Gm-Message-State: ABuFfojgv/meoKAXw2yW39IHUYUWK/DI/SBgVb1eLzOHFiwOs2m6me6B
        g1mOED9vH/qU1VIRgkJntfJjTegF0dL7+iCBH7zoPEubWSs=
X-Google-Smtp-Source: ACcGV61LbNy1sjrSf793hHnSwYLsT0HBDPQmT6PRvXOsL/rH8MzzQw3DLHfo2cfFfOum/wBbF6MmgE09aMQSJsaKU70=
X-Received: by 2002:aca:4ccd:: with SMTP id z196-v6mr1427243oia.318.1539173931040;
 Wed, 10 Oct 2018 05:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <1539073891-7701-1-git-send-email-nborisov@suse.com>
In-Reply-To: <1539073891-7701-1-git-send-email-nborisov@suse.com>
From:   John Pittman <jpittman@redhat.com>
Date:   Wed, 10 Oct 2018 08:18:40 -0400
Message-ID: <CA+RJvhz8U=SkvrDGT9GcJL9WP6kEY0-U3wU7DcrkuKnDQNYejg@mail.gmail.com>
Subject: Re: [dm-devel] [PATCH] dm flakey: Document "error_writes" feature
To:     nborisov@suse.com
Cc:     Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Nikolay, I sent this one to Mike at the end of September.("dm
flakey: add error_writes to documentation -
"https://www.redhat.com/archives/dm-devel/2018-September/msg00146.html).
Unsure if he has picked it up or not.

Best Regards,

John Pittman
Customer Engagement and Experience
Red Hat Inc.

On Wed, Oct 10, 2018 at 4:20 AM Nikolay Borisov <nborisov@suse.com> wrote:
>
> Commit ef548c551e72 ("dm flakey: introduce "error_writes" feature")
> added the ability to dm flakey to error out writes in contrast to
> silently dropping it with 'drop_writes'. Unfortunately this feature
> is not currently documented and one has to be either familiar with the
> source code of dm flakey or check out xfstests sources to know of
> this parameter. So document it.
>
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  Documentation/device-mapper/dm-flakey.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/device-mapper/dm-flakey.txt b/Documentation/device-mapper/dm-flakey.txt
> index c43030718cef..9f0e247d0877 100644
> --- a/Documentation/device-mapper/dm-flakey.txt
> +++ b/Documentation/device-mapper/dm-flakey.txt
> @@ -33,6 +33,10 @@ Table parameters
>         All write I/O is silently ignored.
>         Read I/O is handled correctly.
>
> +  error_writes:
> +       All write I/O is failed with an error signalled.
> +       Read I/O is handled correctly.
> +
>    corrupt_bio_byte <Nth_byte> <direction> <value> <flags>:
>         During <down interval>, replace <Nth_byte> of the data of
>         each matching bio with <value>.
> --
> 2.7.4
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
