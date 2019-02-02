Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 163567D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat,  2 Feb 2019 14:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfBBOcT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 2 Feb 2019 09:32:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33502 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725853AbfBBOcT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Feb 2019 09:32:19 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x12ESZeh106020
        for <linux-doc@vger.kernel.org>; Sat, 2 Feb 2019 09:32:18 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qd8kns706-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 02 Feb 2019 09:32:18 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sat, 2 Feb 2019 14:32:16 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 2 Feb 2019 14:32:13 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x12EWC8c35782774
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 2 Feb 2019 14:32:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D64E55204E;
        Sat,  2 Feb 2019 14:32:12 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.205.162])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 45A8C52051;
        Sat,  2 Feb 2019 14:32:12 +0000 (GMT)
Date:   Sat, 2 Feb 2019 16:32:10 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <me@tobin.cc>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc>
 <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain>
 <20190201160310.5b98eb69@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190201160310.5b98eb69@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19020214-0008-0000-0000-000002BA3B0A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020214-0009-0000-0000-000022264532
Message-Id: <20190202143209.GA8620@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-02-02_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902020120
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 01, 2019 at 04:03:10PM -0700, Jonathan Corbet wrote:
> On Fri, 1 Feb 2019 07:56:08 +1100
> "Tobin C. Harding" <me@tobin.cc> wrote:
> 
> > > > From: "Tobin C. Harding" <tobin@kernel.org>
> > > > 
> > > > sphinx emits warning
> > > > 
> > > >        WARNING: undefined label: memory-allocation ...  
> > > 
> > > Weird, for me it works fine. The generated html at kernel.org [1] also
> > > seems to be Ok...
> > > 
> > > What version of sphinx do you use?  
> > 
> > Thanks for looking at this Mike.  I was running 1.4, I see there is a v2
> > out so I'll upgrade but if the warning doesn't show for you then I'd say
> > we just drop this patch.
> > 
> > Jon,
> > 
> > Is it within your usual workflow to take just the first two patches from
> > this series or would you like me to spin another version without the
> > final patch in it?
> 
> We currently document that 1.4 is supposed to work, so we should stick to
> that; I think I'll go ahead and apply all three patches.
>
> We should maybe consider dragging our minimum version forward a bit, or
> else we might want to document this particular gotcha.

I have 1.4.6 (the one listed in sphinx.rst) and everything worked just
fine...
 
> Thanks,
> 
> jon
> 

-- 
Sincerely yours,
Mike.

