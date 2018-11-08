Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 70FB77D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 12:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbeKHVkH convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 16:40:07 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:43977 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726252AbeKHVkH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 16:40:07 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-13-GOv2ng0dNv2OQOwz1q_ALw-1; Thu, 08 Nov 2018 12:04:06 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 8 Nov 2018 12:02:49 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 8 Nov 2018 12:02:49 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Martin Steigerwald' <martin@lichtvoll.de>,
        Michal Hocko <mhocko@kernel.org>
CC:     Daniel Colascione <dancol@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
        Tim Murray <timmurray@google.com>,
        Joel Fernandes <joelaf@google.com>,
        "Suren Baghdasaryan" <surenb@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        "Mike Rapoport" <rppt@linux.vnet.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2] Document /proc/pid PID reuse behavior
Thread-Topic: [PATCH v2] Document /proc/pid PID reuse behavior
Thread-Index: AQHUdrwX3PD+XlfhcUeFEtVp7YMP66VFxCRg
Date:   Thu, 8 Nov 2018 12:02:49 +0000
Message-ID: <0c5610f128fa49fb9d8f7859e6f61b90@AcuMS.aculab.com>
References: <20181031150625.147369-1-dancol@google.com>
 <CAKOZueu5aDtHDBzp6qKECTHEejjb=dyegQkuHh8NfwgNktzFow@mail.gmail.com>
 <20181107160015.GI27423@dhcp22.suse.cz> <4536090.43ZsV6LvYe@merkaba>
In-Reply-To: <4536090.43ZsV6LvYe@merkaba>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: GOv2ng0dNv2OQOwz1q_ALw-1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Martin Steigerwald
> Sent: 07 November 2018 17:05
...
> Its not quite on-topic, but I am curious now: AFAIK PID limit is 16
> bits. Right? Could it be raised to 32 bits? I bet it would be a major
> change throughout different parts of the kernel.

It is probably 15 bits (since -ve pid numbers are used for process groups).

My guess is that userspace and the system call interface will handle 32bit
(signed) pid numbers.
(I don't remember 'linux emulation' being one of the emulations that
would truncate 32bit pids when one of the BDSs went to 32bit pids.)
The main problem will be that big numbers will mess up the alignment
of printouts from ps and top (etc).
This can be mitigated by only allocating 'big' numbers on systems
that have a lot of pids.
You also really want an O(1) allocator.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

