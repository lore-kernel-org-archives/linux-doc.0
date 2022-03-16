Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3062C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Mar 2022 21:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352294AbiCPVuQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 17:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351894AbiCPVuM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 17:50:12 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15870DEDA
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 14:48:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 90A282C3;
        Wed, 16 Mar 2022 21:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 90A282C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647467337; bh=XnMHvhW3C+yjJerTyeu31dkNZ9xNMRnW8JOlRpluptQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UIoGXN/RmBX7GzZHY+SmevpoixNX0PFNgoTfN3yFz7XQrnq3TNjKvoQ1eR7ZFa6tU
         D1rQCMF5WMpWJbWrx6A7ussy3A9lHtqy5vSTE8wTQYO8azEsuVTGbc0sxieHNijxia
         ix0LnUdQBWoXHK58gfLYYwjNvfo03CqpzyHjaxlDRqvxUMqZwkMzbCwhZIjNjOYgIr
         bP7M8+87CrqocUYdSwIHemFznEWwfL0hKDwUdVAirbDtn1XJBPS0+VtV7pVAl1QglO
         O4dsrSnwtxHATEEYBpXdAa0D2559r4MILZ7ifvGNsSwBWm4gNaxoL9qTdGb8pornYx
         O/8GCfPBHbqGQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Roland Hieber <rhi@pengutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] docs: tracing: use refs for cross-referencing
In-Reply-To: <20220314114644.6unqdbpxcsqin3qu@pengutronix.de>
References: <20220313105557.172732-1-rhi@pengutronix.de>
 <20220313195519.78b96a2c@rorschach.local.home>
 <20220314114644.6unqdbpxcsqin3qu@pengutronix.de>
Date:   Wed, 16 Mar 2022 15:48:56 -0600
Message-ID: <87fsnhsh4n.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Roland Hieber <rhi@pengutronix.de> writes:

> On Sun, Mar 13, 2022 at 07:55:19PM -0400, Steven Rostedt wrote:
>> On Sun, 13 Mar 2022 11:55:55 +0100
>> Roland Hieber <rhi@pengutronix.de> wrote:
>>=20
>> > Help cross-linking the documents by using the :ref: role.
>>=20
>> Note, I and many other people read the .rst files directly, and do not
>> rely on any processing. Is there a better way to do a cross reference
>> like this, because I find this a bit ugly to read.
>
> The main point of this series was to get rid of the manually numbered
> sections (which the next patch does). Relying on manual section numbers
> for cross-referencing is error-prone, which my first iteration of the
> patch already showed=E2=80=A6 Unfortunately, the sphinx reST syntax is no=
t very
> flexible here.

I agree on the removal of the numbered sections.  Those always end up
being wrong after a while.

> I could imagine leaving the file names in when a reference points to a
> different document, like in this hunk:
>
>> > -set_ftrace_filter 'ftrace filter commands' (see the 'Filter commands'
>> > -section of Documentation/trace/ftrace.rst), but there are major
>> > +set_ftrace_filter 'ftrace filter commands' (see the section
>> > +:ref:`ftrace_filter_commands`), but there are major

In general, all of those references and labels clutter the source
considerably and aren't hugely useful to readers of the plain-text
documents.  There are times when they are the best thing to do, but I
think that moderation is indicated.  Just giving the file name will
generate a cross-reference to that file; I would hope that would be
enough most of the time.

Thanks,

jon
