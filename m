Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE1837E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 23:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752291AbeDRXm4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 19:42:56 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:34202 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752091AbeDRXmz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 19:42:55 -0400
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3INYBaE006535;
        Wed, 18 Apr 2018 16:42:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=facebook; bh=l+H00dmrYpWJ0b/qYjGy0bl+yNrI0CwHnWNQgTxvZjw=;
 b=HxtRMRx5knzw4gVsxcVhkDS+08o6RfE0HTTthnTTBd+SGfJTb83OMdCTaN+5N8+rElpb
 p4/kVSuhQ48FR3mFXLvcgnxpFIYbapvs7te1V0XEiB5stxzQtfqy56JqIJ0NSexIyCpy
 wUxCyhW5GXn2ETfpRHfmVe0VQsG7SdsBVYs= 
Received: from mail.thefacebook.com ([199.201.64.23])
        by mx0a-00082601.pphosted.com with ESMTP id 2hee0nr99w-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 18 Apr 2018 16:42:13 -0700
Received: from PRN-CHUB02.TheFacebook.com (2620:10d:c081:35::11) by
 PRN-CHUB16.TheFacebook.com (2620:10d:c081:35::28) with Microsoft SMTP Server
 (TLS) id 14.3.361.1; Wed, 18 Apr 2018 16:42:12 -0700
Received: from kafai-mbp (192.168.52.123) by mail.thefacebook.com
 (192.168.16.12) with Microsoft SMTP Server (TLS) id 14.3.361.1; Wed, 18 Apr
 2018 16:42:10 -0700
Date:   Wed, 18 Apr 2018 16:42:04 -0700
From:   Martin KaFai Lau <kafai@fb.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
CC:     <daniel@iogearbox.net>, <ast@kernel.org>, <netdev@vger.kernel.org>,
        <oss-drivers@netronome.com>, <linux-doc@vger.kernel.org>,
        <linux-man@vger.kernel.org>, Kaixu Xia <xiakaixu@huawei.com>,
        Sargun Dhillon <sargun@sargun.me>, Thomas Graf <tgraf@suug.ch>,
        Gianluca Borello <g.borello@gmail.com>,
        Chenbo Feng <fengc@google.com>
Subject: Re: [PATCH bpf-next v3 6/8] bpf: add documentation for eBPF helpers
 (42-50)
Message-ID: <20180418234202.abrxhspxegdkhunv@kafai-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-7-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-7-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20171208
X-Originating-IP: [192.168.52.123]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-18_06:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:36PM +0100, Quentin Monnet wrote:
[...]
> @@ -965,6 +984,17 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * int bpf_skb_under_cgroup(struct sk_buff *skb, struct bpf_map *map, u32 index)
> + * 	Description
> + * 		Check whether *skb* is a descendant of the cgroup2 held by
> + * 		*map* of type **BPF_MAP_TYPE_CGROUP_ARRAY**, at *index*.
> + * 	Return
> + * 		The return value depends on the result of the test, and can be:
> + *
> + * 		* 0, if the *skb* failed the cgroup2 descendant test.
> + * 		* 1, if the *skb* succeeded the cgroup2 descendant test.
> + * 		* A negative error code, if an error occurred.
> + *
[...]
> + * int bpf_xdp_adjust_head(struct xdp_buff *xdp_md, int delta)
> + * 	Description
> + * 		Adjust (move) *xdp_md*\ **->data** by *delta* bytes. Note that
> + * 		it is possible to use a negative value for *delta*. This helper
> + * 		can be used to prepare the packet for pushing or popping
> + * 		headers.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
LGTM. Thanks!

Acked-by: Martin KaFai Lau <kafai@fb.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
