Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B1367D2EE
	for <lwn-linux-doc@archive.lwn.net>; Wed, 22 Aug 2018 15:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbeHVShO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 22 Aug 2018 14:37:14 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:55440 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbeHVShO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Aug 2018 14:37:14 -0400
Received: by mail-it0-f68.google.com with SMTP id d10-v6so3256393itj.5
        for <linux-doc@vger.kernel.org>; Wed, 22 Aug 2018 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=f8qXEv1/YtiJMHEiJveOQf7NBm42ALITvloNbYdGuPs=;
        b=QKqVpr0BQkia/weP80H2VH8G/dkylKCgk1Qt3mYiRF/mHyLmCcRWVRNR+h4K9s0QHP
         G0i0kAo9T886FXOXay8y6bjJuUgOySJ+YDBissSiR93MNamwBfz3VIsXmvXwga0iZdLK
         IR6etcKTUXONF6f1pvrnZF5ZMWtAgET78aNBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=f8qXEv1/YtiJMHEiJveOQf7NBm42ALITvloNbYdGuPs=;
        b=fZ/HRoNwsVGCkDew7fR8Sp4WHagLTw4l+UTjlgrEu0/ue2gCpwt0mbc04TjPfy4DAt
         nbQLTJffywp4stXbr8dBIweFLxzDXCZ9DObajHzQf0ChS7CWg+oB5voJ2t0ybaFSHZYM
         hTRo3JgmbHTxbLeGrczvO7/0B5b1xMeHCGw5G89PiHvGgDgZcQTtIL3+8cd1mre4tPCi
         AhSvskALF+NmZRj0TXCUGjOR5zR/Kp41adsMxX+UOKNaGHQzcEh5xd9BKhsIbMR+XG2z
         FwQu21zI/kfS/yl7up+zHhg3zCALisB7WhRmZ+mJ+dC9EvCKeC5MaZytS/jWC/Z3Fjs0
         o06g==
X-Gm-Message-State: APzg51BZxpJy3nhieK3/iQvpb/+is8bvUS1PBjgMxC0qSXL1kfPsoC3j
        ckhW13Y1SyZbktWs/PtLdl8unhs2btzm8Yxfu/F//fzcTRU=
X-Google-Smtp-Source: ANB0VdY4GsmPcIlkP3kBq8vvcLehcTc9Y0Do/kTPf8n+GdKrt6xwj38s9PIGCS2W3b7jkKobgzGRtdutAN1tcbrNtEE=
X-Received: by 2002:a24:6c04:: with SMTP id w4-v6mr3652678itb.4.1534950716413;
 Wed, 22 Aug 2018 08:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:e502:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 08:11:55
 -0700 (PDT)
X-Originating-IP: [212.51.149.109]
In-Reply-To: <20180822145924.GA13763@intel.com>
References: <20180821161611.10424-1-brian.starkey@arm.com> <20180821162639.GA21697@bombadil.infradead.org>
 <20180821164416.GA11553@e107564-lin.cambridge.arm.com> <20180822145924.GA13763@intel.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 22 Aug 2018 17:11:55 +0200
Message-ID: <CAKMK7uHxPDfxJaA+1esSW8L2HAjMD6xgF0cMH-nkTjA=6S5+CA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add DOC: overview comment
To:     Eric Engestrom <eric.engestrom@intel.com>
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Alexandru-Cosmin Gheorghe <alexandru-cosmin.gheorghe@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dave Airlie <airlied@linux.ie>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Ayan Kumar Halder <ayan.halder@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 22, 2018 at 4:59 PM, Eric Engestrom
<eric.engestrom@intel.com> wrote:
> On Tuesday, 2018-08-21 17:44:17 +0100, Brian Starkey wrote:
>> Hi Matthew,
>>
>> On Tue, Aug 21, 2018 at 09:26:39AM -0700, Matthew Wilcox wrote:
>> > On Tue, Aug 21, 2018 at 05:16:11PM +0100, Brian Starkey wrote:
>> > > There's a number of things which haven't previously been documented
>> > > around the usage of format modifiers. Capture the current
>> > > understanding in an overview comment and add it to the rst
>> > > documentation.
>> > >
>> > > Ideally, the generated documentation would also include documentation
>> > > of all of the #defines, but the kernel-doc system doesn't currently
>> > > support kernel-doc comments on #define constants.
>> >
>> > Can you turn them into enums?  This seems to work ok:
>> >
>> > -/* color index */
>> > -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
>> > -
>> > -/* 8 bpp Red */
>> > -#define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
>> > +enum {
>> > +       /* color index */
>> > +       DRM_FORMAT_C8   = fourcc_code('C', '8', ' ', ' '), /* [7:0] C */
>> > +       /* 8 bpp Red */
>> > +       DRM_FORMAT_R8   = fourcc_code('R', '8', ' ', ' '), /* [7:0] R */
>> > +};
>> >
>> > but I appreciate this is user API and maybe there's some code out there
>> > that does #ifndef DRM_FORMAT_C8 ...
>>
>> Thanks for the suggestion, Daniel did mention the same. However,
>> unfortunately I don't think we can safely change the UAPI header in
>> this manner.
>
> You could get the best of both worlds by doing both:
>
>   enum {
>     foo = fourcc(...),
>     bar = fourcc(...),
>   }
>   #define foo foo
>   #define bar bar
>
> It would mean a bit more code though, but that way these would now be
> enums (with all the advantages of enums vs plain literals) and still
> pass #ifdef checks :)
>
> (BTW, on the "maybe there's some code that does #ifdef": I can tell you
> there is indeed, having written this myself for an out-of-tree driver
> for customer-modified kernels that may contain additional formats)

Looks reasonable. I'd even put the #define right within each enum line
(as a reminder so people don't forget to add them. Would happily ack a
patch to mass-convert, if that ups the odds of good kerneldoc for all
this.

enum also should support the inline style of kerneldoc (otherwise I
guess we'd need to fix that first, or it just makes no sense at all).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
