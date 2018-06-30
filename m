Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AAC77D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 30 Jun 2018 14:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751109AbeF3O7g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 30 Jun 2018 10:59:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44274 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750802AbeF3O7g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jun 2018 10:59:36 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5UEwxU9007377
        for <linux-doc@vger.kernel.org>; Sat, 30 Jun 2018 10:59:35 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2jx6chhqm9-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 30 Jun 2018 10:59:35 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Sat, 30 Jun 2018 15:59:33 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 30 Jun 2018 15:59:30 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w5UExToN42401998
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 30 Jun 2018 14:59:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D5DBCAE04D;
        Sat, 30 Jun 2018 15:59:19 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 55C45AE045;
        Sat, 30 Jun 2018 15:59:19 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.205.240])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sat, 30 Jun 2018 15:59:19 +0100 (BST)
Date:   Sat, 30 Jun 2018 17:59:27 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] Documentation/sphinx: allow "functions" with no
 parameters
References: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1530306311-10510-2-git-send-email-rppt@linux.vnet.ibm.com>
 <20180630112156.GK7646@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180630112156.GK7646@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18063014-0008-0000-0000-0000024E31FF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18063014-0009-0000-0000-000021B43470
Message-Id: <20180630145927.GA18999@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-30_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=861 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1806300177
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 30, 2018 at 04:21:56AM -0700, Matthew Wilcox wrote:
> On Sat, Jun 30, 2018 at 12:05:10AM +0300, Mike Rapoport wrote:
> > @@ -488,14 +488,19 @@ doc: *title*
> >      .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
> >         :doc: High Definition Audio over HDMI and Display Port
> >  
> > -functions: *function* *[...]*
> > +functions: *[ function ...]*
> >    Include documentation for each *function* in *source*.
> > +  If no *function* if specified, the documentaion for all functions
> 
> "is specified".  "documentation".
> 
> > -  Example::
> > +  Examples::
> >  
> >      .. kernel-doc:: lib/bitmap.c
> >         :functions: bitmap_parselist bitmap_parselist_user
> >  
> > +    .. kernel-doc:: lib/idr.c
> > +       :functions:
> 
> Is this the right syntax?  Should we rather have:
> 
>     .. kernel-doc:: lib/idr.c
>        :functions: *

IMHO :functions: with no parameters is simpler.
 

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
