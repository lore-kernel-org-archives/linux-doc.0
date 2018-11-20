Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 02FF07D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 16:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbeKUDH0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 22:07:26 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39457 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbeKUDHX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 22:07:23 -0500
Received: by mail-qk1-f194.google.com with SMTP id q70so3204038qkh.6
        for <linux-doc@vger.kernel.org>; Tue, 20 Nov 2018 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4G16yYEKxuiLGGqPZ/spDOvHty0DanvYfCipwMzgm0=;
        b=bTmh6LieD+FvZkomC4SuYevLJFEXF5A5p4Jh5iFgx7VdjSdQFSpbqBT3CfowwCkBnt
         AonXRRVAFg94QT0Dd7z1Mx63vdDi3V4TG8bZfATMySL1dnlrIhK61HmosxAsBVmKHZXI
         VnHms7t/O0wEtT+H77cFvYS+2rSTL0+nuXEU8NyUw+MiFNgiEATYDEMy6kKpnq+Pa3dz
         eH5CQrlX3Q7Wq+oVLuhuDRm7yzSD4l1Xj22lSgQyFNHNbpjya3iprQ263U7pN1lkb7Qm
         6Fcd2PMEcRr7z0OOzIyGCCDCkbJ0qqhjEyecMfFNecDz25sLnMQ+XyF54Jq+b+bU147I
         4dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4G16yYEKxuiLGGqPZ/spDOvHty0DanvYfCipwMzgm0=;
        b=S0EJeFf9/VZEqn4NBq2Vxn/3NuiSPYUsQRfHY6mLb/LGrwUn0XNyRi4As0hYq1+sTZ
         msoN7aLtffApz9x/UREoa9EML5SPWYi+/CaEO3HIXehby168/sjrOGik5gnU/aGwtBgP
         TyOR1Hx+46X6bh6X6rVNPBMODhtjstp9K7p6ZGL/UDq2GnGmHtxUAo0zfPnHSbWJqrLs
         VSQ3bHS5Oh5M/Vgah7Bk1Z67kAMmGgoqiPujYku9OXXdQBdxDAhZMnWun4RE0vpWlPSL
         i6EE94P4Z1xYaolJwbbnbkq+HabJ1GqJ5bRTRW2eNW7EJ7I2lCu18V+IAGAQPX943Lha
         Wm9g==
X-Gm-Message-State: AA+aEWbBJ9hLhYb7XbJk4xVgj/av8gPWJ1dC1Rd3T4cfdamEbROkyzMn
        eKdZ8LtEqLokc+6F37pzXu1495A0hn08v/Ow7QqNpg==
X-Google-Smtp-Source: AFSGD/Wu9+CcxOuFNCTc+8pabEuCvaVcn1TGNahb0QR5837PJaAN+r9HWgeZjbnuJ2Q/DMBiP5QHb+G3pyyoryKbisk=
X-Received: by 2002:a37:10cf:: with SMTP id 76mr2315147qkq.99.1542731841261;
 Tue, 20 Nov 2018 08:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20181031150625.147369-1-dancol@google.com> <20181105132205.138695-1-dancol@google.com>
 <20181119105426.GD28607@amd> <1c5caa66-3c61-cb57-754a-f099200c73b2@suse.cz>
In-Reply-To: <1c5caa66-3c61-cb57-754a-f099200c73b2@suse.cz>
From:   Joel Fernandes <joelaf@google.com>
Date:   Tue, 20 Nov 2018 08:37:09 -0800
Message-ID: <CAJWu+orh1imt2iNWQeF+o=uZ-4W=sp4TRzZGi+cO8SectEa0vQ@mail.gmail.com>
Subject: Re: [PATCH v2] Document /proc/pid PID reuse behavior
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     pavel@ucw.cz, Daniel Colascione <dancol@google.com>,
        LKML <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
        Tim Murray <timmurray@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>, guro@fb.com,
        rppt@linux.vnet.ibm.com, kirill.shutemov@linux.intel.com,
        dennisszhou@gmail.com, pdhamdhe@redhat.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 20, 2018 at 1:05 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 11/19/18 11:54 AM, Pavel Machek wrote:
> > On Mon 2018-11-05 13:22:05, Daniel Colascione wrote:
> >> State explicitly that holding a /proc/pid file descriptor open does
> >> not reserve the PID. Also note that in the event of PID reuse, these
> >> open file descriptors refer to the old, now-dead process, and not the
> >> new one that happens to be named the same numeric PID.
> >>
> >> Signed-off-by: Daniel Colascione <dancol@google.com>
> >> ---
> >>  Documentation/filesystems/proc.txt | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> Moved paragraphed to start of /proc/pid section; added signed-off-by.
> >>
> >> diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
> >> index 12a5e6e693b6..0b14460f721d 100644
> >> --- a/Documentation/filesystems/proc.txt
> >> +++ b/Documentation/filesystems/proc.txt
> >> @@ -125,6 +125,13 @@ process running on the system, which is named after the process ID (PID).
> >>  The link  self  points  to  the  process reading the file system. Each process
> >>  subdirectory has the entries listed in Table 1-1.
> >>
> >> +Note that an open a file descriptor to /proc/<pid> or to any of its
> >> +contained files or subdirectories does not prevent <pid> being reused
> >> +for some other process in the event that <pid> exits. Operations on
> >
> > "does not" -> "may not"?
> >
> > We want to leave this unspecified, so that we can change it in future.
>
> Why can't the documentation describe the current implementation, and
> change in the future if the implementation changes? I doubt somebody
> would ever rely on the pid being reused while having the descriptor
> open. How would that make sense?
>

Agreed. I am also of the opinion that this should be documented.

 - Joel
