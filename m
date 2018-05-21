Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 57CC47D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 12:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751738AbeEUMmJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 08:42:09 -0400
Received: from mail-ot0-f193.google.com ([74.125.82.193]:33932 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbeEUMmI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 08:42:08 -0400
Received: by mail-ot0-f193.google.com with SMTP id i5-v6so16692293otf.1;
        Mon, 21 May 2018 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=rwbjy1hoNtdO0AepUcpAJyINmPUaGPHlkTtUF4SNV80=;
        b=TwbBHvPpDBcRKHyfOMKSG6BPWuSqC1NQA9iO0UA0qjHcNBRGvt9EZ9Cb4fitrY0mz1
         Zqqtkk/+nnZMRyl0Ex/VdH9v/IwAdkJTM5IwzcVV5WVlZisEUI4TawKJRsNAn+KOlUHn
         CHWcNg8o6HVDL6YgIejFGL7xv4gCKHFqdzDnjduL6j/iWBZ3EvRCPoPiXZWDSTPoPDqQ
         ewBBq9gHLXS4Qyl3xu8QfttJVR09pDwkbw4075Q+2/eadlQqp/74ViIkEoAwMy2itf7o
         SsVJUX4oEju7OpmrlW7wQcDGbn4g1JpSk9Spaj2nN4E63Tdr20fomZtdSaQl/O+s/sgk
         mf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=rwbjy1hoNtdO0AepUcpAJyINmPUaGPHlkTtUF4SNV80=;
        b=VnOKfIXL+xWpbTJo4O6dq7Q7MspPksI641QkVWT4im2JpQX1I96Yfd6yfQ6lIw2v7r
         j+6jb3ErngI4mZnjsXakmzVt/hSguddA3d85BcMbJuP7WEIYuYkU+AYKcXenTZR57+zh
         S+vkCeS8iDaffNPWzu9gjnb4AY6NhVXgpyBiQzMakERNnbY9oxNNk1DkJf1yyqQwB4q7
         n7L0n8Ewro7K626d6ejYrZyrLXhOKzW5rOGocYCNcSdg8pmmYFjcqpqt4R7ew7lYPHKC
         9yX33V0BQ9A8QSLouU6tXz3XP9okUyKRUDpmbMk8ZrxCHdMlvZ72z5RmCQpXShfWOmFG
         JwOA==
X-Gm-Message-State: ALKqPweZUvFJFROBaifLX33rBZzjNYPIti22C8hFFo82Yauh7ZNKV3Na
        y5P6n4wTA1dNmObThUiigis/YJExi0LDMfRuP1I=
X-Google-Smtp-Source: AB8JxZoYaGfqW73kGqXilrVybtUVhbNUqnylgRiBTudVvb70JMhXwNg0/C7Hy4DL6kaY1TXTxmntLYTX0/+XJtEVfpU=
X-Received: by 2002:a9d:2842:: with SMTP id h2-v6mr14259593otd.210.1526906528290;
 Mon, 21 May 2018 05:42:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.88.68 with HTTP; Mon, 21 May 2018 05:42:07 -0700 (PDT)
In-Reply-To: <20180521104008.z6ei5zjve7u5iwho@lakrids.cambridge.arm.com>
References: <20180425090047.6485-1-ganapatrao.kulkarni@cavium.com>
 <20180425090047.6485-3-ganapatrao.kulkarni@cavium.com> <20180426105938.y6unpt36lisb7kbr@lakrids.cambridge.arm.com>
 <CAKTKpr7Q7T9ZCTBi=LQR=XaAoihbBA3OKCO7yFobzNmR8EfyjQ@mail.gmail.com>
 <CAKTKpr61zBW_D6v_Ck1Lcp0NJ4wPFOpgbiM5aU_EtuiFU-qp4Q@mail.gmail.com>
 <20180521103712.gofbrjdtghfwolmd@lakrids.cambridge.arm.com> <20180521104008.z6ei5zjve7u5iwho@lakrids.cambridge.arm.com>
From:   Ganapatrao Kulkarni <gklkml16@gmail.com>
Date:   Mon, 21 May 2018 18:12:07 +0530
Message-ID: <CAKTKpr7rBj2Ai5jsPgfH308GYNviQm1GWNnkvOhBD_Zak34+-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ThunderX2: Add Cavium ThunderX2 SoC UNCORE PMU driver
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <Will.Deacon@arm.com>, jnair@caviumnetworks.com,
        Robert Richter <Robert.Richter@cavium.com>,
        Vadim.Lomovtsev@cavium.com, Jan.Glauber@cavium.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 21, 2018 at 4:10 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Mon, May 21, 2018 at 11:37:12AM +0100, Mark Rutland wrote:
>> Hi Ganapat,
>>
>>
>> Sorry for the delay in replying; I was away most of last week.
>>
>> On Tue, May 15, 2018 at 04:03:19PM +0530, Ganapatrao Kulkarni wrote:
>> > On Sat, May 5, 2018 at 12:16 AM, Ganapatrao Kulkarni <gklkml16@gmail.com> wrote:
>> > > On Thu, Apr 26, 2018 at 4:29 PM, Mark Rutland <mark.rutland@arm.com> wrote:
>> > >> On Wed, Apr 25, 2018 at 02:30:47PM +0530, Ganapatrao Kulkarni wrote:
>>
>> > >>> +static int alloc_counter(struct thunderx2_pmu_uncore_channel *pmu_uncore)
>> > >>> +{
>> > >>> +     int counter;
>> > >>> +
>> > >>> +     raw_spin_lock(&pmu_uncore->lock);
>> > >>> +     counter = find_first_zero_bit(pmu_uncore->counter_mask,
>> > >>> +                             pmu_uncore->uncore_dev->max_counters);
>> > >>> +     if (counter == pmu_uncore->uncore_dev->max_counters) {
>> > >>> +             raw_spin_unlock(&pmu_uncore->lock);
>> > >>> +             return -ENOSPC;
>> > >>> +     }
>> > >>> +     set_bit(counter, pmu_uncore->counter_mask);
>> > >>> +     raw_spin_unlock(&pmu_uncore->lock);
>> > >>> +     return counter;
>> > >>> +}
>> > >>> +
>> > >>> +static void free_counter(struct thunderx2_pmu_uncore_channel *pmu_uncore,
>> > >>> +                                     int counter)
>> > >>> +{
>> > >>> +     raw_spin_lock(&pmu_uncore->lock);
>> > >>> +     clear_bit(counter, pmu_uncore->counter_mask);
>> > >>> +     raw_spin_unlock(&pmu_uncore->lock);
>> > >>> +}
>> > >>
>> > >> I don't believe that locking is required in either of these, as the perf
>> > >> core serializes pmu::add() and pmu::del(), where these get called.
>> >
>> > without this locking, i am seeing "BUG: scheduling while atomic" when
>> > i run perf with more events together than the maximum counters
>> > supported
>>
>> Did you manage to get to the bottom of this?
>>
>> Do you have a backtrace?
>>
>> It looks like in your latest posting you reserve counters through the
>> userspace ABI, which doesn't seem right to me, and I'd like to
>> understand the problem.
>
> Looks like I misunderstood -- those are still allocated kernel-side.
>
> I'll follow that up in the v5 posting.

please review v5.
>
> Thanks,
> Mark.

thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
