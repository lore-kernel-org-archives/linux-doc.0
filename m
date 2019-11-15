Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DFC217D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Nov 2019 11:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfKOLlf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Nov 2019 06:41:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfKOLlf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Nov 2019 06:41:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DxJX3y0Mz9sP6;
        Fri, 15 Nov 2019 22:41:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573818093;
        bh=u2Pq/kR6KEzBIxFBThrNqj13Tle7QfDFu4tBdYORXbM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KAudABdLeodyQoa/za/ha3rS1V0CkOndZ8fx6HtV99K8206cLnjQ0yYPVngyFilX3
         4nI4BisUSlTKrQkhI0pJPym82bpTxafi5SvF6083c9T3I6DnDVZAWn9r3bkbtFLbur
         jdEvYtkx2Q6nDBEsVLcLyMQsGgytRkYHxkLlyKDE5LNfOK65PAnrtnBBFW7P0VSyin
         BRh8AnsseLHs/TAv/86VaLiMW9CAwP/ZflVbpsZ+hbPZ4198PECU20I7OGsa1pZm/N
         FriVG0HzdQfqvbYk0FR1S6SJyDCfACkDmiCkbbKkVCpvmWs//t9XypN/40CsGjrsAy
         DAiTsxNZw1agA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Anthony Steinhauser <asteinhauser@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] Mention PowerPC in the L1TF documentation.
In-Reply-To: <CAN_oZf21kYk8FZ_Ah93UQ_rCd7afrxiiX7O4v_xbErFRcGXm9w@mail.gmail.com>
References: <20191114221634.258799-1-asteinhauser@google.com> <alpine.DEB.2.21.1911142334250.29616@nanos.tec.linutronix.de> <CAN_oZf21kYk8FZ_Ah93UQ_rCd7afrxiiX7O4v_xbErFRcGXm9w@mail.gmail.com>
Date:   Fri, 15 Nov 2019 22:41:26 +1100
Message-ID: <871ru9e595.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Anthony Steinhauser <asteinhauser@google.com> writes:
> OK, I don't intend to work on it to that extent, so you can consider
> this abandoned.

I or someone else at IBM will pick this up and get it massaged into a
form that Thomas is happy with.

cheers

> On Thu, Nov 14, 2019 at 2:55 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Anthony,
>>
>> On Thu, 14 Nov 2019, asteinhauser@google.com wrote:
>>
>> > From: Anthony Steinhauser <asteinhauser@google.com>
>> >
>> > There is a false negative that L1TF is Intel specific while it affects
>> > also PowerPC:
>> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d
>>
>> Please use the regular
>>
>>    commit 12-char-sha ("powerpc: .......")
>>
>> notation. These links are horrible.
>>
>> > Another false negative is that the kernel is unconditionally protected
>> > against L1TF attacks from userspace. That's true only on x86 but not on
>> > PowerPC where you can turn the protection off by nopti.
>>
>> Missing newline between body and SOB
>>
>> > Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
>> > ---
>> >  Documentation/admin-guide/hw-vuln/l1tf.rst | 15 +++++++++------
>> >  1 file changed, 9 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
>> > index f83212fae4d5..243e494b337a 100644
>> > --- a/Documentation/admin-guide/hw-vuln/l1tf.rst
>> > +++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
>> > @@ -9,10 +9,11 @@ for the access, has the Present bit cleared or other reserved bits set.
>> >  Affected processors
>> >  -------------------
>> >
>> > -This vulnerability affects a wide range of Intel processors. The
>> > -vulnerability is not present on:
>> > +This vulnerability affects a wide range of Intel and PowerPC processors.
>> > +The vulnerability is not present on:
>> >
>> > -   - Processors from AMD, Centaur and other non Intel vendors
>> > +   - Processors from AMD, Centaur and other non Intel vendors except for
>> > +     PowerPC
>>
>> No. This needs restructuring. The non Intel vendor means vendors which
>> produce x86 machines (not really clear TBH), but adding these two PPC parts
>> above and here does not make it any better.
>>
>> >     - Older processor models, where the CPU family is < 6
>>
>> Also this suggest that _ALL_ PowerPC processors are affected as there is
>> no exception list.
>>
>> So I suggest to structure this like this:
>>
>> Affected processors
>> -------------------
>>
>>  1) Intel processors
>>
>>     Move the existing list here
>>
>>  2) PowerPC processors
>>
>>     Add some meat
>>
>> Whether a processor is affected or not...
>>
>> > @@ -125,7 +126,7 @@ mitigations are active. The relevant sysfs file is:
>> >
>> >  /sys/devices/system/cpu/vulnerabilities/l1tf
>> >
>> > -The possible values in this file are:
>> > +The possible values in this file on x86 are:
>>
>> That commit you referenced added the sysfs output for powerpc. So that
>> should be documented properly here as well, right?
>>
>> >    ===========================   ===============================
>> >    'Not affected'             The processor is not vulnerable
>> > @@ -158,8 +159,10 @@ The resulting grade of protection is discussed in the following sections.
>> >  Host mitigation mechanism
>> >  -------------------------
>> >
>> > -The kernel is unconditionally protected against L1TF attacks from malicious
>> > -user space running on the host.
>> > +On x86 the kernel is unconditionally protected against L1TF attacks from
>> > +malicious user space running on the host. On PowerPC the kernel is
>> > +protected by flushing the L1D cache on each transition from kernel to
>> > +userspace unless the 'nopti' boot argument turns this mitigation off.
>>
>> Please make this clearly visually separated. Just glueing this together is
>> hard to read.
>>
>> What about the l1tf boot param? Is it x86 only? If so, then this wants to
>> be added to the the documentation as well.
>>
>> What about the guest to host issue on PPC? Not affected or same mitigation
>> or what?
>>
>> We really spent a lot of time to write understandable and useful
>> documentation. Just sprinkling a few powerpc'isms into it is really not
>> cutting it.
>>
>> This needs proper structuring so that it's obvious for the intended
>> audience (administrators, users) which part is applicable to which
>> architecture or to both.
>>
>> Thanks,
>>
>>         tglx
