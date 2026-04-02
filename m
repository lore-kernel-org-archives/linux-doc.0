Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807F35A3B2
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144758; cv=pass; b=HzQMbSEdsHgQzM421Bca23ghAFKZjrilYblMRHFmkHQZHO6Z3qP7OanAnNEBLbqWomVUP+Lfw1TPegoVOWonsEcCjqpMR28r/wEZQ8giqfo2tNS+GK93cLq9K5vZU/4coJDZzqCkYLoLF3rqEAIwi0x0VUxFBdaJ6nlabAwWT+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144758; c=relaxed/simple;
	bh=/pTHh1FwlwKHTpQht+ePSPn6d2XZSZ5XYd3TyLXK26A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKMvpxPXLvc3R9xra5EESiKTFpkeqB738cDtK4v/L10aYUbgCDwlhwyw8kcpBiK30TyQaAbo/Gppln/KABzrehhDKpxLgIwllTzCOpv4FvWE2jd7Af1U5ckt5I5+dfbKXtyhtogGOWRGRjCaftoVhsSEKr+AHgU1kn0x1se5b2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yl7+vEM/; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yl7+vEM/"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2b636b944so1180132e87.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 08:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775144754; cv=none;
        d=google.com; s=arc-20240605;
        b=TnAu4YnYuoAaBhSdLpdWmfPU3Mzpf5/X+/EJ+7CgCsJcABV0TTmWebrIp9onp39Toh
         ZjFUBdp3FeEjl4lmeAEnnm2aOCcfrZf5cdpTaEwWXVnrr+emM/ApSH/V3lgQAaj1kJw5
         3yc7WNzMZjbJB43Y9olCRzHQV59jan3S8Tyv1C/atcvDuruywOd6ZI3RHw1eVqOlZkMu
         JofD5hQcWApgkzmd8cm+qJk0S7kbNueXnz8UOQnwWPRhU9lFl/1IMs/+MhvtKcWBuca0
         M89hDVCbXckmV3CpUdbtFnt3W6W5COjONQ2j2Vk1eeYjrgfMv/orZWEEAU34HI9BMi5E
         tnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v8pXqmHG/qA51T0dr7MQi7kX0TYmgPL+L8IrHwbfF3E=;
        fh=CS249V2yJRLIJ8ADwEP7QE+Uk+t9YX7On3r3JYpo00s=;
        b=BAEqHfOBZ++jL61CTszC8CJLdOiw4LRK0UtNiOkZFD0W9nB8a6FFYptf8zB+6F9HN2
         jve99hhMM2Pn/d/yEzP3ddW87ozraKXVH6rKGZvo03Gza2NuEbCSUzvNKqXtyym4H0Sf
         kqVYZlX5NJv2ZirnED/dEr+9LmR7RQIX4R8wB7D5EWbYsi7R9oCZ6u8R//PqIdPzDzdL
         duU1ZS2lJlzXY1U1XWPonaQmdXb04guRhrivfv4kPxmQ4JKzHPWR/bR2o844wF8zdzq8
         HZCkvJP60z+ZJEy/8TOU0ZybV3KRfwqBOkSjMJwY46hzlrZ4Z4awazKlI1ZWhy2V2ku0
         YgTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144754; x=1775749554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8pXqmHG/qA51T0dr7MQi7kX0TYmgPL+L8IrHwbfF3E=;
        b=Yl7+vEM//XPrp7wX+dwUboJmURpCGQYJc2d/beW6DoLNGX4ymoyNKbh6PMK801M2dK
         junoT4IHnwP5qM+6lL8OHB5NpAJ3JffaDP+iDLrBgcOdt6PkhXQGnGEqsVVtgTv8QlGl
         bi8bxbvaCtdoyRNl0WHx1FO5e6kSaZTeU8DZKZGmV+/La9ew1Y7gN0OJ7kwItgpyqgud
         tmV8FjtwLAXBH7wcY3DKufwee/hBk9nzlctrd6Do7e8/vdrMYXaApwdNLtph92wUm6NZ
         gfrfEbaKCUQ7IleIgrz60/ntJFxmy0ICKlD4Usv9zw0NgVLyXEFy+tDLlscED+N0B7Tm
         Tjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144754; x=1775749554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8pXqmHG/qA51T0dr7MQi7kX0TYmgPL+L8IrHwbfF3E=;
        b=CmRhjjsZZAuQWcH6zZ4abUv8WAKC1mfECO5VHfD8okRpXI28RjXKJdLFQabH9EM70l
         u6fxqZ9d5sk3TqeasjKNtiV/8gzytvG0Ae5JEJ4kII0XDeMa1MiTJmecsq4shsCq1LI0
         gkn9MfEH0DZT5+905PFgXbjGOqy5DIegT/+aT209ZKhapcUiB112plLydlbtyWW0fym0
         2iuzFRkB7/+0b7114x3Fki/QzpeeaTsQVFdcidPWXxBO55m8swlG6zjbbJNxWyW06Yji
         QreV5Z0gpntBu3xc9+wB/vR6Ot3/7CY4sw3eA2f4rB0Lkf+HIWuX/6KD8i7ESbKv6yJu
         CMcA==
X-Forwarded-Encrypted: i=1; AJvYcCVJCkoIOVdVjW9aggcv/5wo6JlzMRP4PtITXvWXi7FxL7AwkWq8MjvQ2dy6VKuD+oANl+3AeOInbos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSYsOTMfWJatHTCEQ+LJ+iMI3GmHryrQYESltJtzfMMvXMhh4
	AtxBs8vY2zvvx8tyYrNrBeFmH/yePJvNEF1U80ssfkxX4YbVAMPc+uNhdoWyrNLv+1WrFZYRBCG
	vkJw/M2fp7Y/0D3bwPNfFc+9fGOAco/L4rA==
X-Gm-Gg: ATEYQzypd4QBHIDzLRR7sO+sW8n9YjCD9vyQ/jbX89EQe0BgB5x96ztNwNr4ggp+knv
	bAsEdJp6fibZmaJdHngAyjvmNjiK1da3/X/S73ovjcb9coHiqB2m/Byew6O4UuzqsxasGTx3dVy
	cG7lHgar+/iTVeG7PYjLOeaqyp35Ty/BL1o4JdE6Ipa7CEKw5WKRCdfgorjVakF7VW9fizZZs1C
	RE8Bs7wfd4imxH0XNAcyfNdSXGmK9C+3CK8k3m7+vLLL79ZQTpCK6Ei1OjmFxreVC+xVao1J9iH
	jiA+OOYhkIgvfrOj0kPsCOPrZku6YOrPfntAOVNkjhMvGSpQMEZXMBZXCzSoYcrzfzJifLSTQA=
	=
X-Received: by 2002:a05:6512:238e:b0:5a1:26f7:71b with SMTP id
 2adb3069b0e04-5a2c1c9b911mr3539069e87.0.1775144753402; Thu, 02 Apr 2026
 08:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
 <20260205135842.20517-5-seokwoo.chung130@gmail.com> <20260324131204.735c60133288e94718f20d31@kernel.org>
In-Reply-To: <20260324131204.735c60133288e94718f20d31@kernel.org>
From: Ryan Chung <seokwoo.chung130@gmail.com>
Date: Thu, 2 Apr 2026 11:45:42 -0400
X-Gm-Features: AQROBzDhQBJMUd2pX45KTasnqGiAEY84CyM8ttQPZa50vwWtIMxIkKUtK7Q78K4
Message-ID: <CAB1jyqw_6wepbDaKi7087GDUcJ9t1jQO6qP9pa0DWCjti7ABZg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] selftests/ftrace: Add accept cases for fprobe list syntax
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, corbet@lwn.net, shuah@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Masami,

Thank you for your feedback. Unfortunately, I am not in the position
to continue working on this patch series for the foreseeable future.
If you or anyone else on the list would like to pick it up and carry
it forward, you are welcome to do so. I appreciate your time and
effort on this.

Best regards,
Seokwoo Chung

On Tue, 24 Mar 2026 at 00:12, Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> On Thu,  5 Feb 2026 08:58:42 -0500
> "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:
>
> > Add fprobe_list.tc to test the comma-separated symbol list syntax
> > with :entry/:exit suffixes.  Three scenarios are covered:
> >
> >   1. List with default (entry) behavior and ! exclusion
> >   2. List with explicit :entry suffix
> >   3. List with :exit suffix for return probes
>
>
> Could you also add wildcard pattern test?
>
> >
> > Each test verifies that the correct functions appear in
> > enabled_functions and that excluded (!) symbols are absent.
> >
> > Note: The existing tests add_remove_fprobe.tc, fprobe_syntax_errors.tc,
> > and add_remove_fprobe_repeat.tc check their "requires" line against the
> > tracefs README for the old "%return" syntax pattern.  Since the README
> > now documents ":entry|:exit" instead, these tests report UNSUPPORTED.
> > Their "requires" lines need updating in a follow-up patch.
>
> This means you'll break the selftest. please fix those test first.
> (This fix must be done before "tracing/fprobe: Support comma-separated
> symbols and :entry/:exit" so that we can safely bisect it.)
>
> Thank you,
>
>
> >
> > Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> > ---
> >  .../ftrace/test.d/dynevent/fprobe_list.tc     | 92 +++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
> >
> > diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
> > new file mode 100644
> > index 000000000000..45e57c6f487d
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
> > @@ -0,0 +1,92 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# description: Fprobe event list syntax and :entry/:exit suffixes
> > +# requires: dynamic_events "f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]":README
> > +
> > +# Setup symbols to test. These are common kernel functions.
> > +PLACE=vfs_read
> > +PLACE2=vfs_write
> > +PLACE3=vfs_open
> > +
> > +echo 0 > events/enable
> > +echo > dynamic_events
> > +
> > +# Get baseline count of enabled functions (should be 0 if clean, but be safe)
> > +if [ -f enabled_functions ]; then
> > +     ocnt=`cat enabled_functions | wc -l`
> > +else
> > +     ocnt=0
> > +fi
> > +
> > +# Test 1: List default (entry) with exclusion
> > +# Target: Trace vfs_read and vfs_open, but EXCLUDE vfs_write
> > +echo "f:test/list_entry $PLACE,!$PLACE2,$PLACE3" >> dynamic_events
> > +grep -q "test/list_entry" dynamic_events
> > +test -d events/test/list_entry
> > +
> > +echo 1 > events/test/list_entry/enable
> > +
> > +grep -q "$PLACE" enabled_functions
> > +grep -q "$PLACE3" enabled_functions
> > +! grep -q "$PLACE2" enabled_functions
> > +
> > +# Check count (Baseline + 2 new functions)
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $((ocnt + 2)) ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Cleanup Test 1
> > +echo 0 > events/test/list_entry/enable
> > +echo "-:test/list_entry" >> dynamic_events
> > +! grep -q "test/list_entry" dynamic_events
> > +
> > +# Count should return to baseline
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $ocnt ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Test 2: List with explicit :entry suffix
> > +# (Should behave exactly like Test 1)
> > +echo "f:test/list_entry_exp $PLACE,!$PLACE2,$PLACE3:entry" >> dynamic_events
> > +grep -q "test/list_entry_exp" dynamic_events
> > +test -d events/test/list_entry_exp
> > +
> > +echo 1 > events/test/list_entry_exp/enable
> > +
> > +grep -q "$PLACE" enabled_functions
> > +grep -q "$PLACE3" enabled_functions
> > +! grep -q "$PLACE2" enabled_functions
> > +
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $((ocnt + 2)) ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Cleanup Test 2
> > +echo 0 > events/test/list_entry_exp/enable
> > +echo "-:test/list_entry_exp" >> dynamic_events
> > +
> > +# Test 3: List with :exit suffix
> > +echo "f:test/list_exit $PLACE,!$PLACE2,$PLACE3:exit" >> dynamic_events
> > +grep -q "test/list_exit" dynamic_events
> > +test -d events/test/list_exit
> > +
> > +echo 1 > events/test/list_exit/enable
> > +
> > +# Even for return probes, enabled_functions lists the attached symbols
> > +grep -q "$PLACE" enabled_functions
> > +grep -q "$PLACE3" enabled_functions
> > +! grep -q "$PLACE2" enabled_functions
> > +
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $((ocnt + 2)) ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Cleanup Test 3
> > +echo 0 > events/test/list_exit/enable
> > +echo "-:test/list_exit" >> dynamic_events
> > +
> > +clear_trace
> > --
> > 2.43.0
> >
>
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
