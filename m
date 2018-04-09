Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2412A7E8B8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 03:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752927AbeDIDtA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 23:49:00 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:40033 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752460AbeDIDs4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 23:48:56 -0400
Received: by mail-pf0-f193.google.com with SMTP id y66so5062352pfi.7;
        Sun, 08 Apr 2018 20:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X0H1ItUGLrUU9fCmrNjDMs2jc146OjAYJ7PqazXAiGI=;
        b=SycnlpG3psjVy2Hyxzb4aUVNuExr+Djwyoc/4MGAbbeS0uplhTKduq5AhoRhaB+zae
         Ve/7BbuSXOlHy6B+F99qjO0Pj3XPEOTHAp8fc5bX47v325ks0HJPdJfbYdp39MGmEwPy
         z5D+Y0G2BYfnrOkMNfT6brYJKo+YlRWF5du+3yZ0m1IsvEeg4+i9YkWGjJaHGHhMMwHM
         MKhDzRp+4Eb8h1KF2gGt7YDRVQSVAaJiqqEgn6LcJsxQIUhnuP6RvFbT/pJA1AkW0oZM
         wMxtvUrU7omEI+CChk6EQb5N2P1J7S4YurZhYyx0NrnrUZsNkn+rtlxg1dcAjXj6BRFo
         I9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X0H1ItUGLrUU9fCmrNjDMs2jc146OjAYJ7PqazXAiGI=;
        b=W4qMy6Fj8ZNExo+MY2T7KwicseQjAJZ/B9anijbTToZf7QTrhzbUcPk/I5aNrIeHaL
         A9Uoi8jofISNZsCZl1q/QeTRXXD1w3zqeG43W3lBeBa+eOyL/n8JYRLS29Vt8QPvZpmO
         jZvn6vtscD4i8i0sbqyCNI+m+wI7j+dbmt05jLJTKLAd0ynl24HfEmNSFbfL0InJs7B5
         h6BnQd4AS91mK5JvB36AyKu6oP6r/Jhlp15TDzmBDK/fXsk7Nim8/GoftI66P7MBq8Zh
         QbpxYzj+TCK2kYjbdkVELw4dxlt59s0x/HC9wy1vxjvGSbjK+cHuSNyYGlaphDGZOCO2
         CiIQ==
X-Gm-Message-State: AElRT7GGInJvRxTFxvm1rXma8W7KRBa9h5hG8Qlm0j8Vp6ewXASYlmu0
        zulLefftVLnJJOedqmJgPVI=
X-Google-Smtp-Source: AIpwx4/kirFUpx1KdUxzOeaKcVovnL9ofjweerZo+Qa6iWCCMUeEtjpUaQTT99V4li/F4PomtrArvw==
X-Received: by 10.98.236.86 with SMTP id k83mr27733958pfh.84.1523245735813;
        Sun, 08 Apr 2018 20:48:55 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:200::6:e46c])
        by smtp.gmail.com with ESMTPSA id f12sm4314114pgr.37.2018.04.08.20.48.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Apr 2018 20:48:54 -0700 (PDT)
Date:   Sun, 8 Apr 2018 20:48:53 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Message-ID: <20180409034852.fjegoodjikp2ghgw@ast-mbp.dhcp.thefacebook.com>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406111122.11038-1-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 06, 2018 at 12:11:22PM +0100, Quentin Monnet wrote:
> eBPF helper functions can be called from within eBPF programs to perform
> a variety of tasks that would be otherwise hard or impossible to do with
> eBPF itself. There is a growing number of such helper functions in the
> kernel, but documentation is scarce. The main user space header file
> does contain a short commented description of most helpers, but it is
> somewhat outdated and not complete. It is more a "cheat sheet" than a
> real documentation accessible to new eBPF developers.
> 
> This commit attempts to improve the situation by replacing the existing
> overview for the helpers with a more developed description. Furthermore,
> a Python script is added to generate a manual page for eBPF helpers. The
> workflow is the following, and requires the rst2man utility:
> 
>     $ ./scripts/bpf_helpers_doc.py \
>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>     $ man /tmp/bpf-helpers.7
> 
> The objective is to keep all documentation related to the helpers in a
> single place, and to be able to generate from here a manual page that
> could be packaged in the man-pages repository and shipped with most
> distributions [1].
> 
> Additionally, parsing the prototypes of the helper functions could
> hopefully be reused, with a different Printer object, to generate
> header files needed in some eBPF-related projects.
> 
> Regarding the description of each helper, it comprises several items:
> 
> - The function prototype.
> - A description of the function and of its arguments (except for a
>   couple of cases, when there are no arguments and the return value
>   makes the function usage really obvious).
> - A description of return values (if not void).
> - A listing of eBPF program types (if relevant, map types) compatible
>   with the helper.
> - Information about the helper being restricted to GPL programs, or not.
> - The kernel version in which the helper was introduced.
> - The commit that introduced the helper (this is mostly to have it in
>   the source of the man page, as it can be used to track changes and
>   update the page).
> 
> For several helpers, descriptions are inspired (at times, nearly copied)
> from the commit logs introducing them in the kernel--Many thanks to
> their respective authors! They were completed as much as possible, the
> objective being to have something easily accessible even for people just
> starting with eBPF. There is probably a bit more work to do in this
> direction for some helpers.
> 
> Some RST formatting is used in the descriptions (not in function
> prototypes, to keep them readable, but the Python script provided in
> order to generate the RST for the manual page does add formatting to
> prototypes, to produce something pretty) to get "bold" and "italics" in
> manual pages. Hopefully, the descriptions in bpf.h file remains
> perfectly readable. Note that the few trailing white spaces are
> intentional, removing them would break paragraphs for rst2man.
> 
> The descriptions should ideally be updated each time someone adds a new
> helper, or updates the behaviour (compatibility extended to new program
> types, new socket option supported...) or the interface (new flags
> available, ...) of existing ones.
> 
> [1] I have not contacted people from the man-pages project prior to
>     sending this RFC, so I can offer no guaranty at this time that they
>     would accept to take the generated man page.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-man@vger.kernel.org
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h   | 2237 ++++++++++++++++++++++++++++++++++++--------
>  scripts/bpf_helpers_doc.py |  568 +++++++++++
>  2 files changed, 2429 insertions(+), 376 deletions(-)
>  create mode 100755 scripts/bpf_helpers_doc.py
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index c5ec89732a8d..f47aeddbbe0a 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -367,394 +367,1879 @@ union bpf_attr {
>  
>  /* BPF helper function descriptions:
>   *
> - * void *bpf_map_lookup_elem(&map, &key)
> - *     Return: Map value or NULL
> - *
> - * int bpf_map_update_elem(&map, &key, &value, flags)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_map_delete_elem(&map, &key)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_probe_read(void *dst, int size, void *src)
> - *     Return: 0 on success or negative error
> + * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)
> + * 	Description
> + * 		Perform a lookup in *map* for an entry associated to *key*.
> + * 	Return
> + * 		Map value associated to *key*, or **NULL** if no entry was
> + * 		found.
> + * 	For
> + * 		All types of programs. Limited to maps of types
> + * 		**BPF_MAP_TYPE_HASH**,
> + * 		**BPF_MAP_TYPE_ARRAY**,
> + * 		**BPF_MAP_TYPE_PERCPU_HASH**,
> + * 		**BPF_MAP_TYPE_PERCPU_ARRAY**,
> + * 		**BPF_MAP_TYPE_LRU_HASH**,
> + * 		**BPF_MAP_TYPE_LRU_PERCPU_HASH**,
> + * 		**BPF_MAP_TYPE_LPM_TRIE**,
> + * 		**BPF_MAP_TYPE_ARRAY_OF_MAPS**,
> + * 		and **BPF_MAP_TYPE_HASH_OF_MAPS**.
> + * 	GPL only
> + * 		No
> + * 	Since
> + * 		Linux 3.19

I think we should give it a try. There is a risk that it will become stale
and to reduce that I'd propose to remove 'For', 'GPL only' and 'Since',
since for new helpers 'Since' is kinda hard to fill in before it lands
all the way, and 'For' keeps changing as new types are added.

'Description' is the most useful and it needs separate thorough review
for every helper.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
