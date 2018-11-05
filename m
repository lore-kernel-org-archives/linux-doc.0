Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B8057D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 06:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbeKEPVN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Nov 2018 10:21:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36218 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728653AbeKEPVN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Nov 2018 10:21:13 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA55wbB8102978
        for <linux-doc@vger.kernel.org>; Mon, 5 Nov 2018 01:03:13 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2njenru04k-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 05 Nov 2018 01:03:13 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <schwidefsky@de.ibm.com>;
        Mon, 5 Nov 2018 06:03:11 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 5 Nov 2018 06:03:00 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wA562xsR59244588
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Nov 2018 06:02:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CF0E42041;
        Mon,  5 Nov 2018 06:02:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CAD044203F;
        Mon,  5 Nov 2018 06:02:57 +0000 (GMT)
Received: from mschwideX1 (unknown [9.145.56.134])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  5 Nov 2018 06:02:57 +0000 (GMT)
Date:   Mon, 5 Nov 2018 07:02:56 +0100
From:   Martin Schwidefsky <schwidefsky@de.ibm.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        dan.carpenter@oracle.com, adilger.kernel@dilger.ca,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>, tglx@linutronix.de,
        Ingo Molnar <mingo@kernel.org>, paullawrence@google.com,
        sandipan@linux.vnet.ibm.com, andreyknvl@google.com,
        David Woodhouse <dwmw2@infradead.org>, will.deacon@arm.com,
        Philippe Ombredanne <pombredanne@nexb.com>,
        paul.burton@mips.com, rientjes@google.com, w@1wt.eu,
        msebor@gmail.com, Chris Li <sparse@chrisli.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        stefan@agner.ch, luc.vanoostenryck@gmail.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
In-Reply-To: <CAHk-=wj2AEQbmhto6FwxaxLEwvh3GG8FD8p8UptOsh5bE7jcuQ@mail.gmail.com>
References: <20181022105944.GA1411@gmail.com>
        <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
        <29dba7c2-f612-7b35-d665-9939d7e10eb8@virtuozzo.com>
        <CAHk-=wj2AEQbmhto6FwxaxLEwvh3GG8FD8p8UptOsh5bE7jcuQ@mail.gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 18110506-0016-0000-0000-0000021F4C36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110506-0017-0000-0000-000032778A18
Message-Id: <20181105070256.52c6fd8f@mschwideX1>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-05_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=996 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811050054
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Nov 2018 09:09:32 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, Nov 2, 2018 at 2:43 AM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
> >
> > You're right, version checks shouldn't matter here. But __no_sanitize_address_or_inline
> > shouldn't have been added in the first place, because we already have almost the same
> >__no_kasan_or_inline:  
> 
> Ahh, very good.
> 
> Vasily, Martin - since __no_sanitize_address_or_inline was added just
> for s390, would you mind replacing it with __no_kasan_or_inline
> instead, and testing that in whatever failed before?
> 
> Then we can just remove that unnecessary symbol #define entirely..

Ok, will do.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.

