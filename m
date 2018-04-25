Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF2D17E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 08:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750943AbeDYI3d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 04:29:33 -0400
Received: from mail-it0-f42.google.com ([209.85.214.42]:51063 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750882AbeDYI3a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 04:29:30 -0400
Received: by mail-it0-f42.google.com with SMTP id p3-v6so18493964itc.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cW+0tbax+EgA02smpAtOcrmWt8Jdt4ZcSOhVn75zjR0=;
        b=cE7latlhhOCELSF9HOBP0jNm4//ITy0WH6sXLuFKdp5tfZyse1TCbr93N5rXG6FhFt
         pF4hjwgCKTSNADapvlJTpPAKLS3wb9i4V47nr+Mcc2TyaqHEytL5PmVsthFdwM9Fl3PG
         vsv9JvdXqzthP14LcTTPr1XCg8pnKLGh0yOGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cW+0tbax+EgA02smpAtOcrmWt8Jdt4ZcSOhVn75zjR0=;
        b=RMYdr5teHT8AHLfyt/38ThmuZbdH3WB3HoLG1wNH3hBVEFV6l67Po+R+IsB4tVUCvI
         yfckVTM6RgLjtC3uK1L4tZ+gkqv+uCAjgOuSFI1tEOFGPE1RJyrDWljfhDvJEBRYFXEl
         Z9DHCMx6nL8uU6/7qIz9D4TKZdajvfKN1L4RY0qjD/4X3vrwbDRb8rZDae6UdXLq6nbz
         cl7IsvmaWA+AmtI295itdCvbHxKP3WTrzCWXoXTWVW6MQOmnJHM3M3fjX59RpinIlsUi
         Xef1Bbl0Y9xojQ1xj0eoSE6JMLQ9CxvQqYfkuaz/8pHF/WYFlwf1W7LmiG38C7IgW0wB
         WUFA==
X-Gm-Message-State: ALQs6tAC43PGOsXuT1MtPA43Pbzh+ILbyLE/HpbAcwafZ0hgbeHb/xqy
        teveBY2eZWBHrk6+YM1EwmDXngaArRqBznHcsom75g==
X-Google-Smtp-Source: AIpwx4+WU3e4Agq2TJaC3wrhynl34JZjucpCRBtKasg5DY9lxjPkvU3+AWURNt3sTpdQ3z4PGqbGkFVj6xhcmaTj3tM=
X-Received: by 2002:a24:4090:: with SMTP id n138-v6mr22109386ita.135.1524644969682;
 Wed, 25 Apr 2018 01:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:2793:0:0:0:0:0 with HTTP; Wed, 25 Apr 2018 01:29:29
 -0700 (PDT)
In-Reply-To: <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
References: <1524494812-60150-1-git-send-email-bryantly@linux.vnet.ibm.com> <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Apr 2018 10:29:29 +0200
Message-ID: <CACRpkdZH4kheSf_G=i-r=0yZN04W_4bJ1Q7ZXPw=62NrV+LCnQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] misc: IBM Virtual Management Channel Driver
To:     "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
        christoffer.dall@arm.com
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, seroyer@linux.vnet.ibm.com,
        mrochs@linux.vnet.ibm.com, adreznec@linux.vnet.ibm.com,
        fbarrat@linux.vnet.ibm.com,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, mikey@neuling.org,
        Philippe Ombredanne <pombredanne@nexb.com>,
        tlfalcon@linux.vnet.ibm.com, msuchanek@suse.de,
        linux-doc@vger.kernel.org,
        "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I don't know why I'm included in review of this driver, but why
not :) it is good to include people.

Thanks for your patch! It looks exciting and complicated,
I like that kind of stuff.

On Mon, Apr 23, 2018 at 4:46 PM, Bryant G. Ly
<bryantly@linux.vnet.ibm.com> wrote:

> This driver is a logical device which provides an
> interface between the hypervisor and a management
> partition.

Please indicate what this management partition is to
be used for, i.e. the intended use case.

> This driver is to be used for the POWER Virtual
> Management Channel Virtual Adapter on the PowerVM
> platform.

Is that virtualization on the PowerPC platform?

> It provides both request/response and
> async message support through the /dev/ibmvmc node.

Is that a character or block device?
I guess block, but it's nice to have some specifics
in the commit message.

> diff --git a/Documentation/misc-devices/ibmvmc.txt b/Documentation/misc-d=
evices/ibmvmc.txt

The document suffers a bit from internal lingo, so it's be great
if you improve it a bit with a style that will be welcoming for newcomers
who have no idea what you are talking about.

I will point out some items below.

> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Virtual Management Channel (VMC) is a logical device which provides =
an
> +interface between the hypervisor and a management partition.

What kind of interface? A bitstream? Message passing interface?
Marshalling of structs? Some specifics would be great.

> This
> +management partition is intended to provide an alternative to HMC-based
> +system management.

Please expand the acronym HMC for the newcomer so we do not need
to look it up, or it looks like the document is only for people who already
know everything about virtualization specifics.

> In the management partition, a Novalink application
> +exists

Is Novalink some kind of product name? In that case, can it be
instead described with some neutral technology name and state
Novalink as an examplf of this type of technology?

> which enables a system administrator to configure the system=E2=80=99s
> +partitioning characteristics

Exemplify "partitioning characteristics", with a sentence in this
vein: "partitioning characteristics such as FOO, BAR and BAZ".

> via a command line interface (CLI) or
> +Representational State Transfer Application (REST).

I understand what CLI is but what is a representational state
transfer application? Is that a fancy name for a GUI application
doing the same thing as a CLI program would do?

> You can also manage the
> +server by using PowerVC

There was PowerVM now there is PowerVC. What are those things
really? PowerVM I guess is virtual machine on PowerPC? What is
PowerVC? Virtual client (guest) in the PowerVM?

This kind of lingo makes the document a hard read for me.

> or other OpenStack solution.

I heard about OpenStack. I have a vague idea about what it is,
do you mean "other virtualization concepts"?

> Support for
> +conventional HMC management of the system may still be provided on a
> +system; however, when an HMC is attached to the system, the VMC
> +interface is disabled by the hypervisor.

The VMC acronym is expanded below, instead expand it at first
instance. The same for HMC (hypervisor management channel I guess?
it is never really explained.)

> +NovaLink runs on a Linux logical partition on a POWER8 or newer processo=
r-
> +based server that is virtualized by PowerVM.

So this information needs to be in the top of the document.

> System configuration,
> +maintenance, and control functions which traditionally require an HMC ca=
n
> +be implemented in the Novalink using a combination of HMC to hypervisor
> +interfaces and existing operating system methods. This tool provides

What tool? It is unclear what tool we are referring to here.
A command line tool? A technology? etc.

> a
> +subset of the functions implemented by the HMC and enables basic partiti=
on
> +configuration. The set of HMC to hypervisor messages

This makes me think that probably the "h" in HMC stands for "hypervisor"
so now I start to puzzle things together. But it's nicer if you just expand
the acronym the first time you use it.

> supported by the
> +Novalink component

I still haven't figured out what that is, in practice.

> are passed to the hypervisor over a VMC interface, which
> +is defined below.

Maybe some illustration of how HMC, Novalink and VMC work
together would be appropriate?

> +Virtual Management Channel (VMC)
> +A logical device, called the virtual management channel (VMC), is define=
d
> +for communicating between the Novalink application and the hypervisor.


So is "Novalink" some specific application, as in a proprietary
piece of software or something?

I'm still confused.

> +This device, similar to a VSCSI server device,

What is that acronym now, I get completely confused.

> is presented to a designated
> +management partition as a virtual device and is only presented when the
> +system is not HMC managed.
> +This communication device borrows aspects from both VSCSI and ILLAN devi=
ces

Now there is ILLAN too.

> +and is implemented using the CRQ and the RDMA interfaces.

CRQ and RDMA. The RDMA I heard about, I wonder what CRQ is.

At this point the document is referring to so much external a priori
knowledge that I don't have that I don't understand anything at all.

So if this document is meant as an introduction to the technology
for newcomers, it's not working at all, unfortunately.

If some specific domain knowledge is needed to read and
understand the document, you need to state these prerequisites
at the beginning of the document.

Something like: "if you don't know a lot about virtualization already,
then don't even bother trying to read this document".

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
